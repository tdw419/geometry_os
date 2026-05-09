; DESCRIPTION: Draws a black line from (21, 125) to (166, 130).
; PLAN: r0=21(x1), r1=125(y1), r2=166(x2), r3=130(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 125
LDI r2, 166
LDI r3, 130
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
