; DESCRIPTION: Composite: Creates a yellow rectangular region at (191, 94) spanning 107 by 93 pixels then Places a magenta circle of radius 46 at center (169, 48).
; PLAN: r0=191(x), r1=94(y), r2=107(width), r3=93(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=169(x), r6=48(y), r7=46(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 191
LDI r1, 94
LDI r2, 107
LDI r3, 93
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 169
LDI r6, 48
LDI r7, 46
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
