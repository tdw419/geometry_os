; DESCRIPTION: Draws a yellow rectangle at (304, 117) with width 109 and height 78.
; PLAN: r0=304(x), r1=117(y), r2=109(width), r3=78(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 117
LDI r2, 109
LDI r3, 78
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
