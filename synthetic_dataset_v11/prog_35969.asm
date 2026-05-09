; DESCRIPTION: Renders a orange box of size 79x37 starting at (79, 114).
; PLAN: r0=79(x), r1=114(y), r2=79(width), r3=37(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 114
LDI r2, 79
LDI r3, 37
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
