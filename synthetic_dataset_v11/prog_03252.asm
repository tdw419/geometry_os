; DESCRIPTION: Composite: . Then Draws a blue rectangle at (37, 43) with width 88 and height 74. Then Places a white line segment connecting (228, 72) to (32, 43).
; PLAN: r0=37(x), r1=43(y), r2=88(width), r3=74(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=228(x1), r1=72(y1), r2=32(x2), r3=43(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a blue rectangle at (37, 43) with width 88 and height 74.
; PLAN: r0=37(x), r1=43(y), r2=88(width), r3=74(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 43
LDI r2, 88
LDI r3, 74
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a white line segment connecting (228, 72) to (32, 43).
; PLAN: r0=228(x1), r1=72(y1), r2=32(x2), r3=43(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 72
LDI r2, 32
LDI r3, 43
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
