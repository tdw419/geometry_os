; DESCRIPTION: Renders a orange box of size 85x46 starting at (306, 115).
; PLAN: r0=306(x), r1=115(y), r2=85(width), r3=46(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 115
LDI r2, 85
LDI r3, 46
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
