; DESCRIPTION: Renders a orange box of size 18x92 starting at (14, 92).
; PLAN: r0=14(x), r1=92(y), r2=18(width), r3=92(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 92
LDI r2, 18
LDI r3, 92
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
