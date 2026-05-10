; DESCRIPTION: Renders a orange rectangular region spanning 114 by 25 at (292, 16).
; PLAN: r0=292(x), r1=16(y), r2=114(width), r3=25(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 16
LDI r2, 114
LDI r3, 25
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
