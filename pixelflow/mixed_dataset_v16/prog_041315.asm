; DESCRIPTION: Draws a red rectangle at (14, 13) with width 116 and height 103.
; PLAN: r0=14(x), r1=13(y), r2=116(width), r3=103(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 13
LDI r2, 116
LDI r3, 103
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
