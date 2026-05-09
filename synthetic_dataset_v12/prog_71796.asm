; DESCRIPTION: Composite: Renders a purple line between points (314, 19) and (437, 16) then Places a blue 88x60 rectangle at position (57, 160).
; PLAN: r0=314(x1), r1=19(y1), r2=437(x2), r3=16(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=57(x), r6=160(y), r7=88(width), r8=60(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 314
LDI r1, 19
LDI r2, 437
LDI r3, 16
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 57
LDI r6, 160
LDI r7, 88
LDI r8, 60
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
