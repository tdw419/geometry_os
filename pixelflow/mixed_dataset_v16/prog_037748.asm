; DESCRIPTION: Composite: Places a purple 14x57 rectangle at position (276, 139) then Places a yellow line segment connecting (63, 181) to (76, 157).
; PLAN: r0=276(x), r1=139(y), r2=14(width), r3=57(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=63(x1), r6=181(y1), r7=76(x2), r8=157(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 276
LDI r1, 139
LDI r2, 14
LDI r3, 57
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 63
LDI r6, 181
LDI r7, 76
LDI r8, 157
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
