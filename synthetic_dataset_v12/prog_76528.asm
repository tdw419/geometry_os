; DESCRIPTION: Draws a yellow rectangle at (313, 126) with width 23 and height 115.
; PLAN: r0=313(x), r1=126(y), r2=23(width), r3=115(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 126
LDI r2, 23
LDI r3, 115
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
