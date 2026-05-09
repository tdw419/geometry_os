; DESCRIPTION: Composite: Renders a purple line between points (55, 18) and (120, 195) then Places a cyan dot at position (149, 154) then Creates a orange rectangular region at (230, 157) spanning 113 by 54 pixels.
; PLAN: r0=55(x1), r1=18(y1), r2=120(x2), r3=195(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=149(x), r6=154(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=230(x), r11=157(y), r12=113(width), r13=54(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 55
LDI r1, 18
LDI r2, 120
LDI r3, 195
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 149
LDI r6, 154
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 230
LDI r11, 157
LDI r12, 113
LDI r13, 54
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
