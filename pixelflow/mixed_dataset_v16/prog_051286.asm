; DESCRIPTION: Draws a black rectangle at (467, 2) with width 13 and height 59.
; PLAN: r0=467(x), r1=2(y), r2=13(width), r3=59(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 467
LDI r1, 2
LDI r2, 13
LDI r3, 59
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
