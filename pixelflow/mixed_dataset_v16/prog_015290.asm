; DESCRIPTION: Composite: Sets a single magenta pixel at (329, 148) then Renders a magenta box of size 37x25 starting at (294, 17) then Places a magenta circle of radius 52 at center (147, 162).
; PLAN: r0=329(x), r1=148(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=294(x), r6=17(y), r7=37(width), r8=25(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=147(x), r11=162(y), r12=52(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 329
LDI r1, 148
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 294
LDI r6, 17
LDI r7, 37
LDI r8, 25
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 147
LDI r11, 162
LDI r12, 52
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
