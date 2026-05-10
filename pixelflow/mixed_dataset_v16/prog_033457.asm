; DESCRIPTION: Composite: Renders a purple line between points (363, 16) and (188, 225) then Places a blue 15x65 rectangle at position (385, 111) then Places a blue dot at position (53, 176).
; PLAN: r0=363(x1), r1=16(y1), r2=188(x2), r3=225(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=385(x), r6=111(y), r7=15(width), r8=65(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=53(x), r11=176(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 363
LDI r1, 16
LDI r2, 188
LDI r3, 225
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 385
LDI r6, 111
LDI r7, 15
LDI r8, 65
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 53
LDI r11, 176
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
