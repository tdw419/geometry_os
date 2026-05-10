; DESCRIPTION: Renders a orange box of size 109x34 starting at (33, 179).
; PLAN: r0=33(x), r1=179(y), r2=109(width), r3=34(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 179
LDI r2, 109
LDI r3, 34
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
