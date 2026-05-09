; DESCRIPTION: Draws a orange rectangle at (7, 82) with width 29 and height 72.
; PLAN: r0=7(x), r1=82(y), r2=29(width), r3=72(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 82
LDI r2, 29
LDI r3, 72
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
