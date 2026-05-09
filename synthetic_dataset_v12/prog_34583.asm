; DESCRIPTION: Composite: Sets a single red pixel at (268, 159) then Renders a magenta box of size 93x43 starting at (163, 108) then Places a magenta circle of radius 61 at center (208, 98).
; PLAN: r0=268(x), r1=159(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=163(x), r6=108(y), r7=93(width), r8=43(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=208(x), r11=98(y), r12=61(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 268
LDI r1, 159
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 163
LDI r6, 108
LDI r7, 93
LDI r8, 43
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 208
LDI r11, 98
LDI r12, 61
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
