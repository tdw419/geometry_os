; DESCRIPTION: Composite: Renders a orange disk with center (96, 186) and radius 40 then Renders a blue box of size 115x23 starting at (158, 64) then Sets a single white pixel at (130, 53).
; PLAN: r0=96(x), r1=186(y), r2=40(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=158(x), r6=64(y), r7=115(width), r8=23(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=130(x), r11=53(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 96
LDI r1, 186
LDI r2, 40
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 158
LDI r6, 64
LDI r7, 115
LDI r8, 23
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 130
LDI r11, 53
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
