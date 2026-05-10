; DESCRIPTION: Composite: Draws a orange line from (168, 160) to (82, 102) then Draws a green rectangle at (59, 167) with width 71 and height 79.
; PLAN: r0=168(x1), r1=160(y1), r2=82(x2), r3=102(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=59(x), r6=167(y), r7=71(width), r8=79(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 168
LDI r1, 160
LDI r2, 82
LDI r3, 102
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 59
LDI r6, 167
LDI r7, 71
LDI r8, 79
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
