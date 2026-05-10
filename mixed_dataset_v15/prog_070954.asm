; DESCRIPTION: Draws a black rectangle at (280, 121) with width 36 and height 102.
; PLAN: r0=280(x), r1=121(y), r2=36(width), r3=102(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 121
LDI r2, 36
LDI r3, 102
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
