; DESCRIPTION: Composite: Places a green dot at position (341, 192) then Places a cyan circle of radius 22 at center (468, 207) then Renders a yellow box of size 112x69 starting at (11, 8).
; PLAN: r0=341(x), r1=192(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=468(x), r6=207(y), r7=22(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=11(x), r11=8(y), r12=112(width), r13=69(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 341
LDI r1, 192
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 468
LDI r6, 207
LDI r7, 22
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 11
LDI r11, 8
LDI r12, 112
LDI r13, 69
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
