; DESCRIPTION: Places a white line segment connecting (16, 64) to (86, 9).
; PLAN: r0=16(x1), r1=64(y1), r2=86(x2), r3=9(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 64
LDI r2, 86
LDI r3, 9
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
