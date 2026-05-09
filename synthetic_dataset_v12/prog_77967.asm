; DESCRIPTION: Renders a orange box of size 107x22 starting at (15, 23).
; PLAN: r0=15(x), r1=23(y), r2=107(width), r3=22(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 23
LDI r2, 107
LDI r3, 22
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
