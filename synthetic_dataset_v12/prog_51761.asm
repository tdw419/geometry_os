; DESCRIPTION: Renders a orange box of size 72x46 starting at (99, 99).
; PLAN: r0=99(x), r1=99(y), r2=72(width), r3=46(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 99
LDI r2, 72
LDI r3, 46
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
