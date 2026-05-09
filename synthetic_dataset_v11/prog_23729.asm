; DESCRIPTION: Composite: . Then Renders a yellow line between points (196, 113) and (21, 244). Then Draws a green rectangle at (157, 74) with width 70 and height 111.
; PLAN: r0=196(x1), r1=113(y1), r2=21(x2), r3=244(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=157(x), r1=74(y), r2=70(width), r3=111(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a yellow line between points (196, 113) and (21, 244).
; PLAN: r0=196(x1), r1=113(y1), r2=21(x2), r3=244(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 113
LDI r2, 21
LDI r3, 244
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a green rectangle at (157, 74) with width 70 and height 111.
; PLAN: r0=157(x), r1=74(y), r2=70(width), r3=111(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 74
LDI r2, 70
LDI r3, 111
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
