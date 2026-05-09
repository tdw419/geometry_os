; DESCRIPTION: Renders a orange box of size 101x84 starting at (61, 28).
; PLAN: r0=61(x), r1=28(y), r2=101(width), r3=84(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 28
LDI r2, 101
LDI r3, 84
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
