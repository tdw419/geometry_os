; DESCRIPTION: Composite: Renders a cyan box of size 61x12 starting at (205, 155) then Renders a blue disk with center (253, 75) and radius 11 then Places a cyan dot at position (11, 127).
; PLAN: r0=205(x), r1=155(y), r2=61(width), r3=12(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=253(x), r6=75(y), r7=11(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=11(x), r11=127(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 205
LDI r1, 155
LDI r2, 61
LDI r3, 12
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 253
LDI r6, 75
LDI r7, 11
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 11
LDI r11, 127
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
