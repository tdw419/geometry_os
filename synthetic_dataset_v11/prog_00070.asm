; DESCRIPTION: Renders a orange box of size 75x105 starting at (106, 56).
; PLAN: r0=106(x), r1=56(y), r2=75(width), r3=105(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 56
LDI r2, 75
LDI r3, 105
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
