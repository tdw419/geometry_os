; DESCRIPTION: Renders a orange box of size 15x10 starting at (77, 162).
; PLAN: r0=77(x), r1=162(y), r2=15(width), r3=10(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 162
LDI r2, 15
LDI r3, 10
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
