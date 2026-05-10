; DESCRIPTION: Composite: Places a purple line segment connecting (104, 167) to (168, 85) then Places a magenta 17x82 rectangle at position (13, 134).
; PLAN: r0=104(x1), r1=167(y1), r2=168(x2), r3=85(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=13(x), r6=134(y), r7=17(width), r8=82(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 104
LDI r1, 167
LDI r2, 168
LDI r3, 85
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 13
LDI r6, 134
LDI r7, 17
LDI r8, 82
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
