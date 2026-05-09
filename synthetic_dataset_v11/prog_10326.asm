; DESCRIPTION: Draws a green rectangle at (123, 2) with width 82 and height 107.
; PLAN: r0=123(x), r1=2(y), r2=82(width), r3=107(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 2
LDI r2, 82
LDI r3, 107
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
