; DESCRIPTION: Renders a orange box of size 61x62 starting at (357, 127).
; PLAN: r0=357(x), r1=127(y), r2=61(width), r3=62(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 127
LDI r2, 61
LDI r3, 62
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
