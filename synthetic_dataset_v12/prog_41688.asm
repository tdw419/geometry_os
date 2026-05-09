; DESCRIPTION: Draws a yellow rectangle at (113, 11) with width 109 and height 50.
; PLAN: r0=113(x), r1=11(y), r2=109(width), r3=50(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 11
LDI r2, 109
LDI r3, 50
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
