; DESCRIPTION: Draws a blue rectangle at (195, 129) with width 59 and height 81.
; PLAN: r0=195(x), r1=129(y), r2=59(width), r3=81(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 129
LDI r2, 59
LDI r3, 81
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
