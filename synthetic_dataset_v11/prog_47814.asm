; DESCRIPTION: Composite: . Then Draws a red line from (38, 57) to (197, 216). Then Draws a white rectangle at (232, 38) with width 15 and height 12.
; PLAN: r0=38(x1), r1=57(y1), r2=197(x2), r3=216(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=232(x), r1=38(y), r2=15(width), r3=12(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a red line from (38, 57) to (197, 216).
; PLAN: r0=38(x1), r1=57(y1), r2=197(x2), r3=216(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 57
LDI r2, 197
LDI r3, 216
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a white rectangle at (232, 38) with width 15 and height 12.
; PLAN: r0=232(x), r1=38(y), r2=15(width), r3=12(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 38
LDI r2, 15
LDI r3, 12
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
