; DESCRIPTION: Renders a white line between points (213, 248) and (66, 130).
; PLAN: r0=213(x1), r1=248(y1), r2=66(x2), r3=130(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 248
LDI r2, 66
LDI r3, 130
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
