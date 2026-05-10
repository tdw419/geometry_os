; DESCRIPTION: Places a white line segment connecting (270, 17) to (263, 99).
; PLAN: r0=270(x1), r1=17(y1), r2=263(x2), r3=99(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 17
LDI r2, 263
LDI r3, 99
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
