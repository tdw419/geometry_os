; DESCRIPTION: Places a white line segment connecting (306, 99) to (480, 132).
; PLAN: r0=306(x1), r1=99(y1), r2=480(x2), r3=132(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 99
LDI r2, 480
LDI r3, 132
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
