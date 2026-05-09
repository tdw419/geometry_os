; DESCRIPTION: Composite: . Then Draws a cyan rectangle at (56, 2) with width 53 and height 116. Then Renders a blue line between points (70, 5) and (15, 32).
; PLAN: r0=56(x), r1=2(y), r2=53(width), r3=116(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=70(x1), r1=5(y1), r2=15(x2), r3=32(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a cyan rectangle at (56, 2) with width 53 and height 116.
; PLAN: r0=56(x), r1=2(y), r2=53(width), r3=116(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 2
LDI r2, 53
LDI r3, 116
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a blue line between points (70, 5) and (15, 32).
; PLAN: r0=70(x1), r1=5(y1), r2=15(x2), r3=32(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 5
LDI r2, 15
LDI r3, 32
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
