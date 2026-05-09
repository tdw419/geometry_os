; DESCRIPTION: Composite: . Then Places a green line segment connecting (182, 146) to (249, 75). Then Draws a red rectangle at (222, 97) with width 18 and height 100.
; PLAN: r0=182(x1), r1=146(y1), r2=249(x2), r3=75(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=222(x), r1=97(y), r2=18(width), r3=100(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a green line segment connecting (182, 146) to (249, 75).
; PLAN: r0=182(x1), r1=146(y1), r2=249(x2), r3=75(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 146
LDI r2, 249
LDI r3, 75
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a red rectangle at (222, 97) with width 18 and height 100.
; PLAN: r0=222(x), r1=97(y), r2=18(width), r3=100(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 97
LDI r2, 18
LDI r3, 100
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
