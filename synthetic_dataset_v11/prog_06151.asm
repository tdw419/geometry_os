; DESCRIPTION: Composite: . Then Draws a black line from (149, 212) to (184, 218). Then Renders a magenta box of size 98x114 starting at (155, 92).
; PLAN: r0=149(x1), r1=212(y1), r2=184(x2), r3=218(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=155(x), r1=92(y), r2=98(width), r3=114(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a black line from (149, 212) to (184, 218).
; PLAN: r0=149(x1), r1=212(y1), r2=184(x2), r3=218(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 212
LDI r2, 184
LDI r3, 218
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a magenta box of size 98x114 starting at (155, 92).
; PLAN: r0=155(x), r1=92(y), r2=98(width), r3=114(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 92
LDI r2, 98
LDI r3, 114
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
