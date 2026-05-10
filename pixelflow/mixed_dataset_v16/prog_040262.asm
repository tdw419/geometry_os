; DESCRIPTION: Composite: Renders a white box of size 29x96 starting at (24, 111) then Renders a magenta disk with center (205, 190) and radius 66 then Places a red dot at position (120, 109).
; PLAN: r0=24(x), r1=111(y), r2=29(width), r3=96(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=205(x), r6=190(y), r7=66(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=120(x), r11=109(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 24
LDI r1, 111
LDI r2, 29
LDI r3, 96
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 205
LDI r6, 190
LDI r7, 66
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 120
LDI r11, 109
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
