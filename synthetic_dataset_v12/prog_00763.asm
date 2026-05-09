; DESCRIPTION: Composite: Places a blue dot at position (207, 3) then Renders a purple line between points (295, 107) and (92, 191) then Draws a purple rectangle at (109, 74) with width 57 and height 93.
; PLAN: r0=207(x), r1=3(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=295(x1), r6=107(y1), r7=92(x2), r8=191(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=109(x), r11=74(y), r12=57(width), r13=93(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 207
LDI r1, 3
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 295
LDI r6, 107
LDI r7, 92
LDI r8, 191
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 109
LDI r11, 74
LDI r12, 57
LDI r13, 93
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
