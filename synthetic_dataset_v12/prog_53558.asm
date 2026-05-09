; DESCRIPTION: Draws a white line from (312, 130) to (259, 4).
; PLAN: r0=312(x1), r1=130(y1), r2=259(x2), r3=4(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 130
LDI r2, 259
LDI r3, 4
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
