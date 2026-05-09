; DESCRIPTION: Draws a white rectangle at (212, 34) with width 12 and height 59.
; PLAN: r0=212(x), r1=34(y), r2=12(width), r3=59(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 34
LDI r2, 12
LDI r3, 59
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
