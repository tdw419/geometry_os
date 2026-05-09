; DESCRIPTION: Places a green line segment connecting (32, 96) to (27, 40).
; PLAN: r0=32(x1), r1=96(y1), r2=27(x2), r3=40(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 96
LDI r2, 27
LDI r3, 40
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
