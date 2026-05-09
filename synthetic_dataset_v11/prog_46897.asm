; DESCRIPTION: Renders a orange box of size 59x33 starting at (121, 77).
; PLAN: r0=121(x), r1=77(y), r2=59(width), r3=33(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 77
LDI r2, 59
LDI r3, 33
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
