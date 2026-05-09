; DESCRIPTION: Draws a blue rectangle at (113, 117) with width 50 and height 60.
; PLAN: r0=113(x), r1=117(y), r2=50(width), r3=60(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 117
LDI r2, 50
LDI r3, 60
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
