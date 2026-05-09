; DESCRIPTION: Composite: . Then Draws a magenta rectangle at (85, 21) with width 30 and height 83. Then Draws a orange line from (41, 90) to (126, 115).
; PLAN: r0=85(x), r1=21(y), r2=30(width), r3=83(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=41(x1), r1=90(y1), r2=126(x2), r3=115(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a magenta rectangle at (85, 21) with width 30 and height 83.
; PLAN: r0=85(x), r1=21(y), r2=30(width), r3=83(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 21
LDI r2, 30
LDI r3, 83
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a orange line from (41, 90) to (126, 115).
; PLAN: r0=41(x1), r1=90(y1), r2=126(x2), r3=115(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 90
LDI r2, 126
LDI r3, 115
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
