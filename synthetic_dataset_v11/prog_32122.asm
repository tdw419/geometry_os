; DESCRIPTION: Composite: . Then Draws a white rectangle at (117, 114) with width 99 and height 102. Then Places a black line segment connecting (121, 159) to (78, 157).
; PLAN: r0=117(x), r1=114(y), r2=99(width), r3=102(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=121(x1), r1=159(y1), r2=78(x2), r3=157(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a white rectangle at (117, 114) with width 99 and height 102.
; PLAN: r0=117(x), r1=114(y), r2=99(width), r3=102(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 114
LDI r2, 99
LDI r3, 102
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a black line segment connecting (121, 159) to (78, 157).
; PLAN: r0=121(x1), r1=159(y1), r2=78(x2), r3=157(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 159
LDI r2, 78
LDI r3, 157
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
