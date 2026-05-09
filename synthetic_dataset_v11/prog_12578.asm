; DESCRIPTION: Draws a red rectangle at (189, 68) with width 12 and height 14.
; PLAN: r0=189(x), r1=68(y), r2=12(width), r3=14(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 68
LDI r2, 12
LDI r3, 14
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
