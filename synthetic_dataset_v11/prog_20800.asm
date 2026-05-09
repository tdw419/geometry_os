; DESCRIPTION: Composite: . Then Draws a blue rectangle at (19, 12) with width 120 and height 39. Then Draws a red line from (14, 117) to (38, 172).
; PLAN: r0=19(x), r1=12(y), r2=120(width), r3=39(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=14(x1), r1=117(y1), r2=38(x2), r3=172(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a blue rectangle at (19, 12) with width 120 and height 39.
; PLAN: r0=19(x), r1=12(y), r2=120(width), r3=39(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 12
LDI r2, 120
LDI r3, 39
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a red line from (14, 117) to (38, 172).
; PLAN: r0=14(x1), r1=117(y1), r2=38(x2), r3=172(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 117
LDI r2, 38
LDI r3, 172
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
