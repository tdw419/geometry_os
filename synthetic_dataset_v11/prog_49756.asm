; DESCRIPTION: Composite: . Then Draws a green rectangle at (151, 185) with width 19 and height 19. Then Renders a cyan line between points (72, 35) and (91, 187).
; PLAN: r0=151(x), r1=185(y), r2=19(width), r3=19(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=72(x1), r1=35(y1), r2=91(x2), r3=187(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a green rectangle at (151, 185) with width 19 and height 19.
; PLAN: r0=151(x), r1=185(y), r2=19(width), r3=19(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 185
LDI r2, 19
LDI r3, 19
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a cyan line between points (72, 35) and (91, 187).
; PLAN: r0=72(x1), r1=35(y1), r2=91(x2), r3=187(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 35
LDI r2, 91
LDI r3, 187
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
