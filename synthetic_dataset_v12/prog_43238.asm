; DESCRIPTION: Composite: Places a white 46x118 rectangle at position (337, 129) then Renders a black disk with center (195, 84) and radius 32 then Sets a single red pixel at (111, 137).
; PLAN: r0=337(x), r1=129(y), r2=46(width), r3=118(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=195(x), r6=84(y), r7=32(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=111(x), r11=137(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 337
LDI r1, 129
LDI r2, 46
LDI r3, 118
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 195
LDI r6, 84
LDI r7, 32
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 111
LDI r11, 137
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
