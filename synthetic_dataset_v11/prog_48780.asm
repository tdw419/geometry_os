; DESCRIPTION: Renders a orange line between points (107, 47) and (69, 248).
; PLAN: r0=107(x1), r1=47(y1), r2=69(x2), r3=248(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 47
LDI r2, 69
LDI r3, 248
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
