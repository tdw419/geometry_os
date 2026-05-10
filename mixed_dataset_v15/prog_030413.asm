; DESCRIPTION: Composite: Places a purple circle of radius 35 at center (260, 133) then Renders a cyan line between points (377, 207) and (178, 59) then Places a blue 37x87 rectangle at position (230, 46).
; PLAN: r0=260(x), r1=133(y), r2=35(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=377(x1), r6=207(y1), r7=178(x2), r8=59(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=230(x), r11=46(y), r12=37(width), r13=87(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 260
LDI r1, 133
LDI r2, 35
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 377
LDI r6, 207
LDI r7, 178
LDI r8, 59
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 230
LDI r11, 46
LDI r12, 37
LDI r13, 87
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
