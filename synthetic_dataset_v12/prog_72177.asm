; DESCRIPTION: Composite: Places a black 78x78 rectangle at position (101, 14) then Places a magenta line segment connecting (482, 82) to (15, 87).
; PLAN: r0=101(x), r1=14(y), r2=78(width), r3=78(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=482(x1), r6=82(y1), r7=15(x2), r8=87(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 101
LDI r1, 14
LDI r2, 78
LDI r3, 78
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 482
LDI r6, 82
LDI r7, 15
LDI r8, 87
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
