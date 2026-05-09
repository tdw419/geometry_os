; DESCRIPTION: Draws a red rectangle at (106, 58) with width 22 and height 72.
; PLAN: r0=106(x), r1=58(y), r2=22(width), r3=72(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 58
LDI r2, 22
LDI r3, 72
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
