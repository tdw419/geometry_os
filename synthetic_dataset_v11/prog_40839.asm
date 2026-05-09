; DESCRIPTION: Composite: . Then Places a red line segment connecting (204, 66) to (1, 52). Then Draws a orange rectangle at (164, 122) with width 12 and height 70.
; PLAN: r0=204(x1), r1=66(y1), r2=1(x2), r3=52(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=164(x), r1=122(y), r2=12(width), r3=70(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a red line segment connecting (204, 66) to (1, 52).
; PLAN: r0=204(x1), r1=66(y1), r2=1(x2), r3=52(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 66
LDI r2, 1
LDI r3, 52
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a orange rectangle at (164, 122) with width 12 and height 70.
; PLAN: r0=164(x), r1=122(y), r2=12(width), r3=70(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 122
LDI r2, 12
LDI r3, 70
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
