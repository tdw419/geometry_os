; DESCRIPTION: Draws a black rectangle at (372, 58) with width 116 and height 87.
; PLAN: r0=372(x), r1=58(y), r2=116(width), r3=87(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 58
LDI r2, 116
LDI r3, 87
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
