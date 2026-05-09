; DESCRIPTION: Composite: Places a cyan 102x98 rectangle at position (6, 75) then Renders a purple disk with center (116, 232) and radius 17 then Renders a cyan line between points (148, 216) and (335, 201).
; PLAN: r0=6(x), r1=75(y), r2=102(width), r3=98(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=116(x), r6=232(y), r7=17(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=148(x1), r11=216(y1), r12=335(x2), r13=201(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 6
LDI r1, 75
LDI r2, 102
LDI r3, 98
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 116
LDI r6, 232
LDI r7, 17
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 148
LDI r11, 216
LDI r12, 335
LDI r13, 201
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
