; DESCRIPTION: Composite: Places a black dot at position (440, 59) then Creates a green rectangular region at (74, 81) spanning 30 by 50 pixels then Renders a purple disk with center (175, 104) and radius 80.
; PLAN: r0=440(x), r1=59(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=74(x), r6=81(y), r7=30(width), r8=50(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=175(x), r11=104(y), r12=80(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 440
LDI r1, 59
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 74
LDI r6, 81
LDI r7, 30
LDI r8, 50
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 175
LDI r11, 104
LDI r12, 80
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
