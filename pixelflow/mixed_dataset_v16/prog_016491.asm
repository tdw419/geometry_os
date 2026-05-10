; DESCRIPTION: Composite: Renders a cyan line between points (60, 59) and (385, 169) then Places a yellow 57x43 rectangle at position (253, 179) then Places a blue circle of radius 15 at center (31, 16).
; PLAN: r0=60(x1), r1=59(y1), r2=385(x2), r3=169(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=253(x), r6=179(y), r7=57(width), r8=43(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=31(x), r11=16(y), r12=15(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 60
LDI r1, 59
LDI r2, 385
LDI r3, 169
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 253
LDI r6, 179
LDI r7, 57
LDI r8, 43
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 31
LDI r11, 16
LDI r12, 15
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
