; DESCRIPTION: Draws a green rectangle at (107, 191) with width 59 and height 53.
; PLAN: r0=107(x), r1=191(y), r2=59(width), r3=53(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 191
LDI r2, 59
LDI r3, 53
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
