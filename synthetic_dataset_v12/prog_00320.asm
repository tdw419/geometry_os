; DESCRIPTION: Composite: Places a magenta 54x39 rectangle at position (232, 2) then Draws a black line from (26, 236) to (508, 69).
; PLAN: r0=232(x), r1=2(y), r2=54(width), r3=39(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=26(x1), r6=236(y1), r7=508(x2), r8=69(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 232
LDI r1, 2
LDI r2, 54
LDI r3, 39
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 26
LDI r6, 236
LDI r7, 508
LDI r8, 69
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
