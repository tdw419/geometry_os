; DESCRIPTION: Draws a green rectangle at (405, 19) with width 48 and height 90.
; PLAN: r0=405(x), r1=19(y), r2=48(width), r3=90(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 19
LDI r2, 48
LDI r3, 90
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
