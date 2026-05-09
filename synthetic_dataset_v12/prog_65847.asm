; DESCRIPTION: Draws a blue rectangle at (214, 10) with width 60 and height 19.
; PLAN: r0=214(x), r1=10(y), r2=60(width), r3=19(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 10
LDI r2, 60
LDI r3, 19
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
