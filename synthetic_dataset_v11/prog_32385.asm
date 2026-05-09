; DESCRIPTION: Draws a black rectangle at (218, 96) with width 36 and height 108.
; PLAN: r0=218(x), r1=96(y), r2=36(width), r3=108(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 96
LDI r2, 36
LDI r3, 108
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
