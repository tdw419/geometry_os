; DESCRIPTION: Renders a orange box of size 58x78 starting at (59, 132).
; PLAN: r0=59(x), r1=132(y), r2=58(width), r3=78(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 132
LDI r2, 58
LDI r3, 78
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
