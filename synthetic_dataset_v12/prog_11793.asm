; DESCRIPTION: Draws a black rectangle at (254, 171) with width 94 and height 71.
; PLAN: r0=254(x), r1=171(y), r2=94(width), r3=71(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 171
LDI r2, 94
LDI r3, 71
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
