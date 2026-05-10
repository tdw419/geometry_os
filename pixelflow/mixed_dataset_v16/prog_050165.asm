; DESCRIPTION: Draws a yellow rectangle at (28, 220) with width 72 and height 13.
; PLAN: r0=28(x), r1=220(y), r2=72(width), r3=13(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 220
LDI r2, 72
LDI r3, 13
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
