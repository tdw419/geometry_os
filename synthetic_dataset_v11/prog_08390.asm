; DESCRIPTION: Draws a black rectangle at (104, 133) with width 61 and height 38.
; PLAN: r0=104(x), r1=133(y), r2=61(width), r3=38(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 133
LDI r2, 61
LDI r3, 38
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
