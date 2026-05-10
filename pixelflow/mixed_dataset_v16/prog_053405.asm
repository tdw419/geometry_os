; DESCRIPTION: Draws a red rectangle at (153, 68) with width 116 and height 98.
; PLAN: r0=153(x), r1=68(y), r2=116(width), r3=98(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 68
LDI r2, 116
LDI r3, 98
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
