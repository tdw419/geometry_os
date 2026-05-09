; DESCRIPTION: Draws a yellow rectangle at (9, 151) with width 68 and height 82.
; PLAN: r0=9(x), r1=151(y), r2=68(width), r3=82(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 151
LDI r2, 68
LDI r3, 82
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
