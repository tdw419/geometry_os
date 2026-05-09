; DESCRIPTION: Renders a orange box of size 54x116 starting at (223, 69).
; PLAN: r0=223(x), r1=69(y), r2=54(width), r3=116(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 69
LDI r2, 54
LDI r3, 116
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
