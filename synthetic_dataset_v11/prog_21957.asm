; DESCRIPTION: Draws a blue rectangle at (44, 33) with width 27 and height 79.
; PLAN: r0=44(x), r1=33(y), r2=27(width), r3=79(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 33
LDI r2, 27
LDI r3, 79
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
