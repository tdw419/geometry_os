; DESCRIPTION: Composite: . Then Draws a orange line from (202, 199) to (241, 28). Then Draws a magenta rectangle at (68, 10) with width 57 and height 118.
; PLAN: r0=202(x1), r1=199(y1), r2=241(x2), r3=28(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=68(x), r1=10(y), r2=57(width), r3=118(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a orange line from (202, 199) to (241, 28).
; PLAN: r0=202(x1), r1=199(y1), r2=241(x2), r3=28(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 199
LDI r2, 241
LDI r3, 28
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a magenta rectangle at (68, 10) with width 57 and height 118.
; PLAN: r0=68(x), r1=10(y), r2=57(width), r3=118(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 10
LDI r2, 57
LDI r3, 118
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
