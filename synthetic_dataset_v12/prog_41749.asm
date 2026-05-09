; DESCRIPTION: Draws a black rectangle at (279, 53) with width 56 and height 50.
; PLAN: r0=279(x), r1=53(y), r2=56(width), r3=50(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 53
LDI r2, 56
LDI r3, 50
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
