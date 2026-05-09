; DESCRIPTION: Composite: . Then Draws a white circle centered at (136, 86) with radius 17. Then Draws a orange line from (27, 43) to (27, 75).
; PLAN: r0=136(x), r1=86(y), r2=17(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=27(x1), r1=43(y1), r2=27(x2), r3=75(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a white circle centered at (136, 86) with radius 17.
; PLAN: r0=136(x), r1=86(y), r2=17(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 136
LDI r1, 86
LDI r2, 17
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a orange line from (27, 43) to (27, 75).
; PLAN: r0=27(x1), r1=43(y1), r2=27(x2), r3=75(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 43
LDI r2, 27
LDI r3, 75
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
