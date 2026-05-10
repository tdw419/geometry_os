; DESCRIPTION: Composite: Renders a red disk with center (205, 112) and radius 59 then Places a yellow 81x102 rectangle at position (350, 104) then Places a green dot at position (412, 224).
; PLAN: r0=205(x), r1=112(y), r2=59(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=350(x), r6=104(y), r7=81(width), r8=102(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=412(x), r11=224(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 205
LDI r1, 112
LDI r2, 59
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 350
LDI r6, 104
LDI r7, 81
LDI r8, 102
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 412
LDI r11, 224
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
