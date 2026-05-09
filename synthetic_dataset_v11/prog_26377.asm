; DESCRIPTION: Renders a orange box of size 109x68 starting at (138, 33).
; PLAN: r0=138(x), r1=33(y), r2=109(width), r3=68(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 33
LDI r2, 109
LDI r3, 68
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
