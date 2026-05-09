; DESCRIPTION: Composite: Places a blue dot at position (292, 189) then Creates a black rectangular region at (361, 28) spanning 71 by 109 pixels then Renders a black line between points (255, 19) and (29, 124).
; PLAN: r0=292(x), r1=189(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=361(x), r6=28(y), r7=71(width), r8=109(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=255(x1), r11=19(y1), r12=29(x2), r13=124(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 292
LDI r1, 189
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 361
LDI r6, 28
LDI r7, 71
LDI r8, 109
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 255
LDI r11, 19
LDI r12, 29
LDI r13, 124
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
