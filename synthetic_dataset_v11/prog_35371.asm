; DESCRIPTION: Composite: . Then Draws a white rectangle at (80, 240) with width 116 and height 14. Then Renders a yellow line between points (132, 7) and (188, 151).
; PLAN: r0=80(x), r1=240(y), r2=116(width), r3=14(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=132(x1), r1=7(y1), r2=188(x2), r3=151(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a white rectangle at (80, 240) with width 116 and height 14.
; PLAN: r0=80(x), r1=240(y), r2=116(width), r3=14(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 240
LDI r2, 116
LDI r3, 14
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a yellow line between points (132, 7) and (188, 151).
; PLAN: r0=132(x1), r1=7(y1), r2=188(x2), r3=151(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 7
LDI r2, 188
LDI r3, 151
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
