; DESCRIPTION: Composite: Places a blue 118x53 rectangle at position (321, 130) then Places a magenta circle of radius 61 at center (216, 193) then Places a magenta dot at position (374, 135).
; PLAN: r0=321(x), r1=130(y), r2=118(width), r3=53(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=216(x), r6=193(y), r7=61(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=374(x), r11=135(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 321
LDI r1, 130
LDI r2, 118
LDI r3, 53
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 216
LDI r6, 193
LDI r7, 61
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 374
LDI r11, 135
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
