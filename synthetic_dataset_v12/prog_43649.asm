; DESCRIPTION: Composite: Places a green dot at position (258, 121) then Renders a magenta disk with center (75, 49) and radius 38 then Places a green 11x30 rectangle at position (131, 205).
; PLAN: r0=258(x), r1=121(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=75(x), r6=49(y), r7=38(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=131(x), r11=205(y), r12=11(width), r13=30(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 258
LDI r1, 121
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 75
LDI r6, 49
LDI r7, 38
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 131
LDI r11, 205
LDI r12, 11
LDI r13, 30
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
