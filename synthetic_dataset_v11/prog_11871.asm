; DESCRIPTION: Draws a white line from (169, 165) to (253, 91).
; PLAN: r0=169(x1), r1=165(y1), r2=253(x2), r3=91(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 165
LDI r2, 253
LDI r3, 91
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
