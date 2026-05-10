; DESCRIPTION: Draws a blue rectangle at (171, 4) with width 113 and height 90.
; PLAN: r0=171(x), r1=4(y), r2=113(width), r3=90(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 4
LDI r2, 113
LDI r3, 90
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
