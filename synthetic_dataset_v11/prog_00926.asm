; DESCRIPTION: Composite: . Then Draws a red rectangle at (149, 156) with width 15 and height 90. Then Draws a yellow line from (89, 64) to (74, 156).
; PLAN: r0=149(x), r1=156(y), r2=15(width), r3=90(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=89(x1), r1=64(y1), r2=74(x2), r3=156(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a red rectangle at (149, 156) with width 15 and height 90.
; PLAN: r0=149(x), r1=156(y), r2=15(width), r3=90(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 156
LDI r2, 15
LDI r3, 90
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a yellow line from (89, 64) to (74, 156).
; PLAN: r0=89(x1), r1=64(y1), r2=74(x2), r3=156(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 64
LDI r2, 74
LDI r3, 156
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
