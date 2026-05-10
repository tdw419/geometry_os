; DESCRIPTION: Draws a purple rectangle at (313, 173) with width 95 and height 111.
; PLAN: r0=313(x), r1=173(y), r2=95(width), r3=111(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 173
LDI r2, 95
LDI r3, 111
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
