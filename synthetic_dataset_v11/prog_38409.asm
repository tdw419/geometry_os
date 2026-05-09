; DESCRIPTION: Draws a blue rectangle at (18, 206) with width 61 and height 18.
; PLAN: r0=18(x), r1=206(y), r2=61(width), r3=18(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 206
LDI r2, 61
LDI r3, 18
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
