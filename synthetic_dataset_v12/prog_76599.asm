; DESCRIPTION: Renders a orange box of size 96x107 starting at (99, 23).
; PLAN: r0=99(x), r1=23(y), r2=96(width), r3=107(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 23
LDI r2, 96
LDI r3, 107
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
