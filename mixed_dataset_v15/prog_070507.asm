; DESCRIPTION: Draws a white line from (306, 17) to (86, 161).
; PLAN: r0=306(x1), r1=17(y1), r2=86(x2), r3=161(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 17
LDI r2, 86
LDI r3, 161
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
