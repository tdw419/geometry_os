; DESCRIPTION: Draws a blue rectangle at (401, 173) with width 111 and height 83.
; PLAN: r0=401(x), r1=173(y), r2=111(width), r3=83(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 173
LDI r2, 111
LDI r3, 83
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
