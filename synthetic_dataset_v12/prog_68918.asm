; DESCRIPTION: Composite: Renders a blue disk with center (334, 111) and radius 60 then Sets a single purple pixel at (143, 215) then Renders a green box of size 66x101 starting at (106, 105).
; PLAN: r0=334(x), r1=111(y), r2=60(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=143(x), r6=215(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=106(x), r11=105(y), r12=66(width), r13=101(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 334
LDI r1, 111
LDI r2, 60
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 143
LDI r6, 215
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 106
LDI r11, 105
LDI r12, 66
LDI r13, 101
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
