; DESCRIPTION: Composite: . Then Draws a white line from (19, 113) to (121, 56). Then Draws a red rectangle at (165, 55) with width 44 and height 38.
; PLAN: r0=19(x1), r1=113(y1), r2=121(x2), r3=56(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=165(x), r1=55(y), r2=44(width), r3=38(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a white line from (19, 113) to (121, 56).
; PLAN: r0=19(x1), r1=113(y1), r2=121(x2), r3=56(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 113
LDI r2, 121
LDI r3, 56
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a red rectangle at (165, 55) with width 44 and height 38.
; PLAN: r0=165(x), r1=55(y), r2=44(width), r3=38(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 55
LDI r2, 44
LDI r3, 38
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
