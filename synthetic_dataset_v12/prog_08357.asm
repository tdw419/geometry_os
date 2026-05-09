; DESCRIPTION: Draws a yellow rectangle at (421, 40) with width 27 and height 82.
; PLAN: r0=421(x), r1=40(y), r2=27(width), r3=82(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 40
LDI r2, 27
LDI r3, 82
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
