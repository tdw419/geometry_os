; DESCRIPTION: Draws a yellow rectangle at (132, 83) with width 82 and height 50.
; PLAN: r0=132(x), r1=83(y), r2=82(width), r3=50(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 83
LDI r2, 82
LDI r3, 50
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
