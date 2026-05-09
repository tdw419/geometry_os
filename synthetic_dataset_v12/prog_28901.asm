; DESCRIPTION: Composite: Draws a cyan circle centered at (165, 138) with radius 50 then Renders a green line between points (221, 222) and (479, 255) then Creates a purple rectangular region at (235, 127) spanning 76 by 15 pixels.
; PLAN: r0=165(x), r1=138(y), r2=50(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=221(x1), r6=222(y1), r7=479(x2), r8=255(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=235(x), r11=127(y), r12=76(width), r13=15(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 165
LDI r1, 138
LDI r2, 50
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 221
LDI r6, 222
LDI r7, 479
LDI r8, 255
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 235
LDI r11, 127
LDI r12, 76
LDI r13, 15
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
