; DESCRIPTION: Composite: . Then Draws a cyan rectangle at (151, 88) with width 78 and height 58. Then Renders a black line between points (180, 155) and (239, 23).
; PLAN: r0=151(x), r1=88(y), r2=78(width), r3=58(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=180(x1), r1=155(y1), r2=239(x2), r3=23(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a cyan rectangle at (151, 88) with width 78 and height 58.
; PLAN: r0=151(x), r1=88(y), r2=78(width), r3=58(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 88
LDI r2, 78
LDI r3, 58
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a black line between points (180, 155) and (239, 23).
; PLAN: r0=180(x1), r1=155(y1), r2=239(x2), r3=23(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 155
LDI r2, 239
LDI r3, 23
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
