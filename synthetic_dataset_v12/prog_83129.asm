; DESCRIPTION: Composite: Renders a purple box of size 111x26 starting at (383, 55) then Places a black line segment connecting (38, 29) to (472, 173) then Places a yellow dot at position (243, 205).
; PLAN: r0=383(x), r1=55(y), r2=111(width), r3=26(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=38(x1), r6=29(y1), r7=472(x2), r8=173(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=243(x), r11=205(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 383
LDI r1, 55
LDI r2, 111
LDI r3, 26
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 38
LDI r6, 29
LDI r7, 472
LDI r8, 173
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 243
LDI r11, 205
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
