; DESCRIPTION: Draws a blue rectangle at (44, 128) with width 82 and height 60.
; PLAN: r0=44(x), r1=128(y), r2=82(width), r3=60(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 128
LDI r2, 82
LDI r3, 60
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
