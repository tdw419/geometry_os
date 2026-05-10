; DESCRIPTION: Renders a orange box of size 117x101 starting at (335, 46).
; PLAN: r0=335(x), r1=46(y), r2=117(width), r3=101(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 46
LDI r2, 117
LDI r3, 101
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
