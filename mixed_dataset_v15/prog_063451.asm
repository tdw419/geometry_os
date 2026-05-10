; DESCRIPTION: Composite: Places a green 37x14 rectangle at position (193, 220) then Draws a orange line from (266, 141) to (116, 24).
; PLAN: r0=193(x), r1=220(y), r2=37(width), r3=14(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=266(x1), r6=141(y1), r7=116(x2), r8=24(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 193
LDI r1, 220
LDI r2, 37
LDI r3, 14
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 266
LDI r6, 141
LDI r7, 116
LDI r8, 24
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
