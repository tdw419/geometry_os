; DESCRIPTION: Composite: . Then Draws a white rectangle at (117, 128) with width 84 and height 96. Then Renders a yellow line between points (225, 150) and (5, 189).
; PLAN: r0=117(x), r1=128(y), r2=84(width), r3=96(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=225(x1), r1=150(y1), r2=5(x2), r3=189(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a white rectangle at (117, 128) with width 84 and height 96.
; PLAN: r0=117(x), r1=128(y), r2=84(width), r3=96(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 128
LDI r2, 84
LDI r3, 96
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a yellow line between points (225, 150) and (5, 189).
; PLAN: r0=225(x1), r1=150(y1), r2=5(x2), r3=189(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 150
LDI r2, 5
LDI r3, 189
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
