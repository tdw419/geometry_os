; DESCRIPTION: Draws a orange rectangle at (53, 82) with width 100 and height 70.
; PLAN: r0=53(x), r1=82(y), r2=100(width), r3=70(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 82
LDI r2, 100
LDI r3, 70
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
