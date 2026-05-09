; DESCRIPTION: Draws a orange rectangle at (297, 29) with width 77 and height 58.
; PLAN: r0=297(x), r1=29(y), r2=77(width), r3=58(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 29
LDI r2, 77
LDI r3, 58
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
