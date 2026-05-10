; DESCRIPTION: Composite: Creates a black rectangular region at (304, 15) spanning 107 by 90 pixels then Renders a magenta disk with center (228, 129) and radius 73 then Places a blue dot at position (99, 93).
; PLAN: r0=304(x), r1=15(y), r2=107(width), r3=90(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=228(x), r6=129(y), r7=73(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=99(x), r11=93(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 304
LDI r1, 15
LDI r2, 107
LDI r3, 90
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 228
LDI r6, 129
LDI r7, 73
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 99
LDI r11, 93
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
