; DESCRIPTION: Renders a orange box of size 59x99 starting at (23, 108).
; PLAN: r0=23(x), r1=108(y), r2=59(width), r3=99(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 108
LDI r2, 59
LDI r3, 99
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
