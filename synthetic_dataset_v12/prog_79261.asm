; DESCRIPTION: Draws a black rectangle at (294, 99) with width 14 and height 81.
; PLAN: r0=294(x), r1=99(y), r2=14(width), r3=81(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 99
LDI r2, 14
LDI r3, 81
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
