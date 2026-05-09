; DESCRIPTION: Renders a orange box of size 54x119 starting at (77, 112).
; PLAN: r0=77(x), r1=112(y), r2=54(width), r3=119(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 112
LDI r2, 54
LDI r3, 119
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
