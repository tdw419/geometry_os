; DESCRIPTION: Draws a white rectangle at (278, 50) with width 103 and height 118.
; PLAN: r0=278(x), r1=50(y), r2=103(width), r3=118(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 50
LDI r2, 103
LDI r3, 118
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
