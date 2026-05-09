; DESCRIPTION: Renders a orange box of size 99x92 starting at (102, 58).
; PLAN: r0=102(x), r1=58(y), r2=99(width), r3=92(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 58
LDI r2, 99
LDI r3, 92
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
