; DESCRIPTION: Composite: Renders a blue box of size 93x81 starting at (213, 110) then Creates a red circular shape at (291, 107) with radius 44.
; PLAN: r0=213(x), r1=110(y), r2=93(width), r3=81(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=291(x), r6=107(y), r7=44(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 213
LDI r1, 110
LDI r2, 93
LDI r3, 81
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 291
LDI r6, 107
LDI r7, 44
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
