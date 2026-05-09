; DESCRIPTION: Renders a orange box of size 11x105 starting at (54, 48).
; PLAN: r0=54(x), r1=48(y), r2=11(width), r3=105(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 48
LDI r2, 11
LDI r3, 105
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
