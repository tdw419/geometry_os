; DESCRIPTION: Renders a orange box of size 106x29 starting at (79, 88).
; PLAN: r0=79(x), r1=88(y), r2=106(width), r3=29(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 88
LDI r2, 106
LDI r3, 29
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
