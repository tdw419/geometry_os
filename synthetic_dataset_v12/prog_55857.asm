; DESCRIPTION: Draws a red rectangle at (221, 65) with width 116 and height 65.
; PLAN: r0=221(x), r1=65(y), r2=116(width), r3=65(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 65
LDI r2, 116
LDI r3, 65
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
