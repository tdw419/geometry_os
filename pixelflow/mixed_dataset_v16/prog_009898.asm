; DESCRIPTION: Composite: Places a orange line segment connecting (457, 122) to (116, 195) then Places a green 108x25 rectangle at position (362, 61).
; PLAN: r0=457(x1), r1=122(y1), r2=116(x2), r3=195(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=362(x), r6=61(y), r7=108(width), r8=25(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 457
LDI r1, 122
LDI r2, 116
LDI r3, 195
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 362
LDI r6, 61
LDI r7, 108
LDI r8, 25
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
