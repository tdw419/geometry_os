; DESCRIPTION: Draws a blue rectangle at (403, 86) with width 44 and height 29.
; PLAN: r0=403(x), r1=86(y), r2=44(width), r3=29(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 86
LDI r2, 44
LDI r3, 29
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
