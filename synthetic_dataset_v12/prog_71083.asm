; DESCRIPTION: Draws a red rectangle at (130, 157) with width 99 and height 58.
; PLAN: r0=130(x), r1=157(y), r2=99(width), r3=58(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 157
LDI r2, 99
LDI r3, 58
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
