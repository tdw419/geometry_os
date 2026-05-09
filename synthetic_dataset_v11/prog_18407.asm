; DESCRIPTION: Composite: . Then Places a orange line segment connecting (29, 181) to (106, 202). Then Draws a white rectangle at (7, 6) with width 27 and height 107.
; PLAN: r0=29(x1), r1=181(y1), r2=106(x2), r3=202(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=7(x), r1=6(y), r2=27(width), r3=107(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a orange line segment connecting (29, 181) to (106, 202).
; PLAN: r0=29(x1), r1=181(y1), r2=106(x2), r3=202(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 181
LDI r2, 106
LDI r3, 202
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a white rectangle at (7, 6) with width 27 and height 107.
; PLAN: r0=7(x), r1=6(y), r2=27(width), r3=107(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 6
LDI r2, 27
LDI r3, 107
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
