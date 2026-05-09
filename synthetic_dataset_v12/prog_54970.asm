; DESCRIPTION: Draws a blue rectangle at (356, 39) with width 77 and height 96.
; PLAN: r0=356(x), r1=39(y), r2=77(width), r3=96(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 39
LDI r2, 77
LDI r3, 96
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
