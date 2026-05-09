; DESCRIPTION: Composite: Places a purple line segment connecting (489, 92) to (103, 230) then Places a green 58x22 rectangle at position (438, 169).
; PLAN: r0=489(x1), r1=92(y1), r2=103(x2), r3=230(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=438(x), r6=169(y), r7=58(width), r8=22(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 489
LDI r1, 92
LDI r2, 103
LDI r3, 230
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 438
LDI r6, 169
LDI r7, 58
LDI r8, 22
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
