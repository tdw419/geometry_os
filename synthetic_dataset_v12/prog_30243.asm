; DESCRIPTION: Composite: Places a blue dot at position (119, 15) then Renders a black box of size 64x69 starting at (176, 61) then Renders a red line between points (442, 59) and (139, 117).
; PLAN: r0=119(x), r1=15(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=176(x), r6=61(y), r7=64(width), r8=69(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=442(x1), r11=59(y1), r12=139(x2), r13=117(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 119
LDI r1, 15
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 176
LDI r6, 61
LDI r7, 64
LDI r8, 69
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 442
LDI r11, 59
LDI r12, 139
LDI r13, 117
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
