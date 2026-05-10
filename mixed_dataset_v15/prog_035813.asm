; DESCRIPTION: Composite: Sets a single red pixel at (274, 50) then Renders a magenta disk with center (393, 185) and radius 24 then Renders a magenta box of size 118x94 starting at (301, 88).
; PLAN: r0=274(x), r1=50(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=393(x), r6=185(y), r7=24(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=301(x), r11=88(y), r12=118(width), r13=94(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 274
LDI r1, 50
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 393
LDI r6, 185
LDI r7, 24
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 301
LDI r11, 88
LDI r12, 118
LDI r13, 94
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
