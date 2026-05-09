; DESCRIPTION: Draws a orange rectangle at (53, 93) with width 95 and height 75.
; PLAN: r0=53(x), r1=93(y), r2=95(width), r3=75(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 93
LDI r2, 95
LDI r3, 75
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
