; DESCRIPTION: Draws a yellow rectangle at (135, 173) with width 31 and height 51.
; PLAN: r0=135(x), r1=173(y), r2=31(width), r3=51(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 173
LDI r2, 31
LDI r3, 51
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
