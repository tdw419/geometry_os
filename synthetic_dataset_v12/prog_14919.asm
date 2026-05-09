; DESCRIPTION: Composite: Places a cyan dot at position (436, 178) then Places a white 105x119 rectangle at position (69, 136) then Renders a cyan line between points (409, 96) and (255, 230).
; PLAN: r0=436(x), r1=178(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=69(x), r6=136(y), r7=105(width), r8=119(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=409(x1), r11=96(y1), r12=255(x2), r13=230(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 436
LDI r1, 178
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 69
LDI r6, 136
LDI r7, 105
LDI r8, 119
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 409
LDI r11, 96
LDI r12, 255
LDI r13, 230
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
