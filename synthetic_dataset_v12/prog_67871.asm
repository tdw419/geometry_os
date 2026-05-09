; DESCRIPTION: Draws a orange rectangle at (300, 47) with width 102 and height 116.
; PLAN: r0=300(x), r1=47(y), r2=102(width), r3=116(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 47
LDI r2, 102
LDI r3, 116
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
