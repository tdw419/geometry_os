; DESCRIPTION: Draws a red rectangle at (72, 14) with width 35 and height 103.
; PLAN: r0=72(x), r1=14(y), r2=35(width), r3=103(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 14
LDI r2, 35
LDI r3, 103
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
