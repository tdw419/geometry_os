; DESCRIPTION: Composite: Places a magenta 49x92 rectangle at position (158, 106) then Renders a cyan disk with center (371, 62) and radius 29 then Places a cyan line segment connecting (210, 126) to (258, 186).
; PLAN: r0=158(x), r1=106(y), r2=49(width), r3=92(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=371(x), r6=62(y), r7=29(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=210(x1), r11=126(y1), r12=258(x2), r13=186(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 158
LDI r1, 106
LDI r2, 49
LDI r3, 92
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 371
LDI r6, 62
LDI r7, 29
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 210
LDI r11, 126
LDI r12, 258
LDI r13, 186
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
