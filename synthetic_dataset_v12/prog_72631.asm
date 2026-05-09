; DESCRIPTION: Renders a orange box of size 81x107 starting at (350, 138).
; PLAN: r0=350(x), r1=138(y), r2=81(width), r3=107(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 138
LDI r2, 81
LDI r3, 107
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
