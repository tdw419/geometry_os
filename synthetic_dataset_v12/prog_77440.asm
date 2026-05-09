; DESCRIPTION: Composite: Places a yellow line segment connecting (94, 206) to (364, 64) then Places a red 74x115 rectangle at position (411, 109).
; PLAN: r0=94(x1), r1=206(y1), r2=364(x2), r3=64(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=411(x), r6=109(y), r7=74(width), r8=115(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 94
LDI r1, 206
LDI r2, 364
LDI r3, 64
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 411
LDI r6, 109
LDI r7, 74
LDI r8, 115
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
