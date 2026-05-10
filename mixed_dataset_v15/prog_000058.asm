; DESCRIPTION: Composite: Places a blue 108x59 rectangle at position (287, 104) then Sets a single yellow pixel at (191, 25) then Renders a cyan disk with center (321, 96) and radius 67.
; PLAN: r0=287(x), r1=104(y), r2=108(width), r3=59(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=191(x), r6=25(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=321(x), r11=96(y), r12=67(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 287
LDI r1, 104
LDI r2, 108
LDI r3, 59
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 191
LDI r6, 25
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 321
LDI r11, 96
LDI r12, 67
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
