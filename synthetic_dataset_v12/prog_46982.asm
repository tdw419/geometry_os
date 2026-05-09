; DESCRIPTION: Places a green line segment connecting (32, 128) to (491, 83).
; PLAN: r0=32(x1), r1=128(y1), r2=491(x2), r3=83(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 128
LDI r2, 491
LDI r3, 83
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
