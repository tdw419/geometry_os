; DESCRIPTION: Renders a orange box of size 106x106 starting at (138, 17).
; PLAN: r0=138(x), r1=17(y), r2=106(width), r3=106(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 17
LDI r2, 106
LDI r3, 106
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
