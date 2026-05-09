; DESCRIPTION: Places a white line segment connecting (100, 9) to (128, 127).
; PLAN: r0=100(x1), r1=9(y1), r2=128(x2), r3=127(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 9
LDI r2, 128
LDI r3, 127
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
