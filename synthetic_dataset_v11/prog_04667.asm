; DESCRIPTION: Renders a orange box of size 115x119 starting at (70, 95).
; PLAN: r0=70(x), r1=95(y), r2=115(width), r3=119(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 95
LDI r2, 115
LDI r3, 119
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
