; DESCRIPTION: Draws a orange rectangle at (379, 47) with width 50 and height 102.
; PLAN: r0=379(x), r1=47(y), r2=50(width), r3=102(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 47
LDI r2, 50
LDI r3, 102
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
