; DESCRIPTION: Draws a blue rectangle at (214, 57) with width 19 and height 108.
; PLAN: r0=214(x), r1=57(y), r2=19(width), r3=108(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 57
LDI r2, 19
LDI r3, 108
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
