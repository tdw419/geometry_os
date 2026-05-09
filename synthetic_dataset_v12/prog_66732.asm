; DESCRIPTION: Draws a blue rectangle at (299, 127) with width 28 and height 103.
; PLAN: r0=299(x), r1=127(y), r2=28(width), r3=103(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 127
LDI r2, 28
LDI r3, 103
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
