; DESCRIPTION: Renders a orange box of size 45x92 starting at (98, 97).
; PLAN: r0=98(x), r1=97(y), r2=45(width), r3=92(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 97
LDI r2, 45
LDI r3, 92
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
