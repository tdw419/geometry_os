; DESCRIPTION: Composite: Places a green dot at position (114, 36) then Renders a green box of size 15x80 starting at (472, 12) then Renders a blue disk with center (305, 185) and radius 45.
; PLAN: r0=114(x), r1=36(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=472(x), r6=12(y), r7=15(width), r8=80(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=305(x), r11=185(y), r12=45(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 114
LDI r1, 36
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 472
LDI r6, 12
LDI r7, 15
LDI r8, 80
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 305
LDI r11, 185
LDI r12, 45
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
