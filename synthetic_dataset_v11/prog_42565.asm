; DESCRIPTION: Draws a blue rectangle at (27, 11) with width 77 and height 33.
; PLAN: r0=27(x), r1=11(y), r2=77(width), r3=33(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 11
LDI r2, 77
LDI r3, 33
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
