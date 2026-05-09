; DESCRIPTION: Composite: . Then Draws a orange circle centered at (174, 177) with radius 59. Then Renders a white line between points (46, 7) and (43, 110).
; PLAN: r0=174(x), r1=177(y), r2=59(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=46(x1), r1=7(y1), r2=43(x2), r3=110(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a orange circle centered at (174, 177) with radius 59.
; PLAN: r0=174(x), r1=177(y), r2=59(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 174
LDI r1, 177
LDI r2, 59
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a white line between points (46, 7) and (43, 110).
; PLAN: r0=46(x1), r1=7(y1), r2=43(x2), r3=110(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 7
LDI r2, 43
LDI r3, 110
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
