; DESCRIPTION: Composite: . Then Renders a black line between points (191, 240) and (23, 235). Then Draws a magenta rectangle at (91, 70) with width 31 and height 101.
; PLAN: r0=191(x1), r1=240(y1), r2=23(x2), r3=235(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=91(x), r1=70(y), r2=31(width), r3=101(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a black line between points (191, 240) and (23, 235).
; PLAN: r0=191(x1), r1=240(y1), r2=23(x2), r3=235(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 240
LDI r2, 23
LDI r3, 235
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a magenta rectangle at (91, 70) with width 31 and height 101.
; PLAN: r0=91(x), r1=70(y), r2=31(width), r3=101(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 70
LDI r2, 31
LDI r3, 101
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
