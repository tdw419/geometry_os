; DESCRIPTION: Draws a yellow rectangle at (429, 191) with width 24 and height 33.
; PLAN: r0=429(x), r1=191(y), r2=24(width), r3=33(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 191
LDI r2, 24
LDI r3, 33
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
