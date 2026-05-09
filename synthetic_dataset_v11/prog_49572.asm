; DESCRIPTION: Composite: . Then Places a blue 44x19 rectangle at position (25, 237). Then Draws a cyan line from (105, 113) to (158, 30).
; PLAN: r0=25(x), r1=237(y), r2=44(width), r3=19(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=105(x1), r1=113(y1), r2=158(x2), r3=30(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a blue 44x19 rectangle at position (25, 237).
; PLAN: r0=25(x), r1=237(y), r2=44(width), r3=19(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 237
LDI r2, 44
LDI r3, 19
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a cyan line from (105, 113) to (158, 30).
; PLAN: r0=105(x1), r1=113(y1), r2=158(x2), r3=30(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 113
LDI r2, 158
LDI r3, 30
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
