; DESCRIPTION: Draws a blue rectangle at (413, 177) with width 72 and height 62.
; PLAN: r0=413(x), r1=177(y), r2=72(width), r3=62(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 177
LDI r2, 72
LDI r3, 62
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
