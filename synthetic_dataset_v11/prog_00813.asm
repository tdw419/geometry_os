; DESCRIPTION: Composite: . Then Draws a purple rectangle at (41, 167) with width 19 and height 21. Then Renders a white line between points (157, 181) and (122, 16).
; PLAN: r0=41(x), r1=167(y), r2=19(width), r3=21(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=157(x1), r1=181(y1), r2=122(x2), r3=16(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a purple rectangle at (41, 167) with width 19 and height 21.
; PLAN: r0=41(x), r1=167(y), r2=19(width), r3=21(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 167
LDI r2, 19
LDI r3, 21
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a white line between points (157, 181) and (122, 16).
; PLAN: r0=157(x1), r1=181(y1), r2=122(x2), r3=16(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 181
LDI r2, 122
LDI r3, 16
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
