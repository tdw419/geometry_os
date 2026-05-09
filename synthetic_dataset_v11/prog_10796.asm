; DESCRIPTION: Composite: . Then Places a orange line segment connecting (49, 220) to (168, 26). Then Draws a green rectangle at (127, 48) with width 12 and height 102.
; PLAN: r0=49(x1), r1=220(y1), r2=168(x2), r3=26(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=127(x), r1=48(y), r2=12(width), r3=102(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a orange line segment connecting (49, 220) to (168, 26).
; PLAN: r0=49(x1), r1=220(y1), r2=168(x2), r3=26(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 220
LDI r2, 168
LDI r3, 26
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a green rectangle at (127, 48) with width 12 and height 102.
; PLAN: r0=127(x), r1=48(y), r2=12(width), r3=102(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 48
LDI r2, 12
LDI r3, 102
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
