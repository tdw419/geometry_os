; DESCRIPTION: Composite: . Then Draws a white line from (121, 13) to (97, 1). Then Draws a red rectangle at (155, 17) with width 38 and height 98.
; PLAN: r0=121(x1), r1=13(y1), r2=97(x2), r3=1(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=155(x), r1=17(y), r2=38(width), r3=98(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a white line from (121, 13) to (97, 1).
; PLAN: r0=121(x1), r1=13(y1), r2=97(x2), r3=1(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 13
LDI r2, 97
LDI r3, 1
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a red rectangle at (155, 17) with width 38 and height 98.
; PLAN: r0=155(x), r1=17(y), r2=38(width), r3=98(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 17
LDI r2, 38
LDI r3, 98
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
