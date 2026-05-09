; DESCRIPTION: Draws a blue rectangle at (213, 37) with width 50 and height 58.
; PLAN: r0=213(x), r1=37(y), r2=50(width), r3=58(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 37
LDI r2, 50
LDI r3, 58
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
