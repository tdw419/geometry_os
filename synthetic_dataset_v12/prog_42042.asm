; DESCRIPTION: Draws a red rectangle at (330, 44) with width 38 and height 116.
; PLAN: r0=330(x), r1=44(y), r2=38(width), r3=116(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 44
LDI r2, 38
LDI r3, 116
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
