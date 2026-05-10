; DESCRIPTION: Composite: Places a purple dot at position (156, 246) then Places a cyan 109x16 rectangle at position (285, 60) then Draws a green line from (188, 15) to (389, 105).
; PLAN: r0=156(x), r1=246(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=285(x), r6=60(y), r7=109(width), r8=16(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=188(x1), r11=15(y1), r12=389(x2), r13=105(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 156
LDI r1, 246
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 285
LDI r6, 60
LDI r7, 109
LDI r8, 16
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 188
LDI r11, 15
LDI r12, 389
LDI r13, 105
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
