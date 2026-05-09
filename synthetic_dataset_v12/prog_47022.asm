; DESCRIPTION: Draws a black rectangle at (382, 27) with width 91 and height 97.
; PLAN: r0=382(x), r1=27(y), r2=91(width), r3=97(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 27
LDI r2, 91
LDI r3, 97
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
