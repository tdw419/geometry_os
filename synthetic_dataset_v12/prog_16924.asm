; DESCRIPTION: Draws a red rectangle at (333, 116) with width 109 and height 116.
; PLAN: r0=333(x), r1=116(y), r2=109(width), r3=116(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 116
LDI r2, 109
LDI r3, 116
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
