; DESCRIPTION: Places a cyan line segment connecting (58, 176) to (80, 128).
; PLAN: r0=58(x1), r1=176(y1), r2=80(x2), r3=128(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 176
LDI r2, 80
LDI r3, 128
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
