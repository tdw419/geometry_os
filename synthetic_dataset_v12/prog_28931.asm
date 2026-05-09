; DESCRIPTION: Renders a orange box of size 77x70 starting at (309, 118).
; PLAN: r0=309(x), r1=118(y), r2=77(width), r3=70(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 118
LDI r2, 77
LDI r3, 70
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
