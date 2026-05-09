; DESCRIPTION: Draws a blue rectangle at (202, 15) with width 59 and height 90.
; PLAN: r0=202(x), r1=15(y), r2=59(width), r3=90(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 15
LDI r2, 59
LDI r3, 90
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
