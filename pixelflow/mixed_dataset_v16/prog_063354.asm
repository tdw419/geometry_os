; DESCRIPTION: Composite: Renders a green line between points (476, 53) and (161, 247) then Draws a orange circle centered at (214, 151) with radius 66.
; PLAN: r0=476(x1), r1=53(y1), r2=161(x2), r3=247(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=214(x), r6=151(y), r7=66(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 476
LDI r1, 53
LDI r2, 161
LDI r3, 247
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 214
LDI r6, 151
LDI r7, 66
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
