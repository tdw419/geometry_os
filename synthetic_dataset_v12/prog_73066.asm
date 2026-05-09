; DESCRIPTION: Draws a black rectangle at (248, 94) with width 102 and height 72.
; PLAN: r0=248(x), r1=94(y), r2=102(width), r3=72(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 94
LDI r2, 102
LDI r3, 72
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
