; DESCRIPTION: Draws a blue rectangle at (359, 47) with width 27 and height 32.
; PLAN: r0=359(x), r1=47(y), r2=27(width), r3=32(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 47
LDI r2, 27
LDI r3, 32
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
