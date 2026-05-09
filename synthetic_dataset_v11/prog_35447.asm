; DESCRIPTION: Draws a white line from (148, 165) to (28, 130).
; PLAN: r0=148(x1), r1=165(y1), r2=28(x2), r3=130(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 165
LDI r2, 28
LDI r3, 130
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
