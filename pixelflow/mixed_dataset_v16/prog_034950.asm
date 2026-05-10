; DESCRIPTION: Draws a green rectangle at (355, 76) with width 30 and height 61.
; PLAN: r0=355(x), r1=76(y), r2=30(width), r3=61(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 76
LDI r2, 30
LDI r3, 61
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
