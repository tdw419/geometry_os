; DESCRIPTION: Composite: Places a cyan 34x117 rectangle at position (404, 38) then Places a purple dot at position (490, 23) then Places a purple line segment connecting (377, 247) to (94, 204).
; PLAN: r0=404(x), r1=38(y), r2=34(width), r3=117(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=490(x), r6=23(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=377(x1), r11=247(y1), r12=94(x2), r13=204(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 404
LDI r1, 38
LDI r2, 34
LDI r3, 117
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 490
LDI r6, 23
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 377
LDI r11, 247
LDI r12, 94
LDI r13, 204
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
