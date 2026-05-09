; DESCRIPTION: Draws a green rectangle at (322, 191) with width 98 and height 38.
; PLAN: r0=322(x), r1=191(y), r2=98(width), r3=38(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 191
LDI r2, 98
LDI r3, 38
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
