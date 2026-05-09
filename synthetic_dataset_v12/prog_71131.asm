; DESCRIPTION: Renders a orange box of size 74x66 starting at (234, 155).
; PLAN: r0=234(x), r1=155(y), r2=74(width), r3=66(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 155
LDI r2, 74
LDI r3, 66
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
