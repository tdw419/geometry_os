; DESCRIPTION: Composite: Renders a black line between points (271, 220) and (258, 47) then Places a yellow dot at position (133, 157) then Draws a cyan rectangle at (415, 15) with width 79 and height 108.
; PLAN: r0=271(x1), r1=220(y1), r2=258(x2), r3=47(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=133(x), r6=157(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=415(x), r11=15(y), r12=79(width), r13=108(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 271
LDI r1, 220
LDI r2, 258
LDI r3, 47
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 133
LDI r6, 157
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 415
LDI r11, 15
LDI r12, 79
LDI r13, 108
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
