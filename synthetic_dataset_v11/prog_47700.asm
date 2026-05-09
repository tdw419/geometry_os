; DESCRIPTION: Composite: . Then Renders a cyan line between points (210, 17) and (214, 67). Then Draws a orange circle centered at (95, 178) with radius 15.
; PLAN: r0=210(x1), r1=17(y1), r2=214(x2), r3=67(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=95(x), r1=178(y), r2=15(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a cyan line between points (210, 17) and (214, 67).
; PLAN: r0=210(x1), r1=17(y1), r2=214(x2), r3=67(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 17
LDI r2, 214
LDI r3, 67
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a orange circle centered at (95, 178) with radius 15.
; PLAN: r0=95(x), r1=178(y), r2=15(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 95
LDI r1, 178
LDI r2, 15
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
