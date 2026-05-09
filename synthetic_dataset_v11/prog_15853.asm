; DESCRIPTION: Composite: . Then Renders a cyan line between points (161, 78) and (232, 158). Then Creates a orange circular shape at (167, 194) with radius 44.
; PLAN: r0=161(x1), r1=78(y1), r2=232(x2), r3=158(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=167(x), r1=194(y), r2=44(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a cyan line between points (161, 78) and (232, 158).
; PLAN: r0=161(x1), r1=78(y1), r2=232(x2), r3=158(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 78
LDI r2, 232
LDI r3, 158
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a orange circular shape at (167, 194) with radius 44.
; PLAN: r0=167(x), r1=194(y), r2=44(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 167
LDI r1, 194
LDI r2, 44
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
