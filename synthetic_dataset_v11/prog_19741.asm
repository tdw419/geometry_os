; DESCRIPTION: Composite: . Then Renders a orange line between points (161, 27) and (167, 205). Then Draws a black circle centered at (138, 166) with radius 71.
; PLAN: r0=161(x1), r1=27(y1), r2=167(x2), r3=205(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=138(x), r1=166(y), r2=71(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a orange line between points (161, 27) and (167, 205).
; PLAN: r0=161(x1), r1=27(y1), r2=167(x2), r3=205(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 27
LDI r2, 167
LDI r3, 205
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a black circle centered at (138, 166) with radius 71.
; PLAN: r0=138(x), r1=166(y), r2=71(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 138
LDI r1, 166
LDI r2, 71
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
