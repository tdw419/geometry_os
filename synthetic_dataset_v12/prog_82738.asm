; DESCRIPTION: Renders a orange box of size 61x84 starting at (85, 73).
; PLAN: r0=85(x), r1=73(y), r2=61(width), r3=84(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 73
LDI r2, 61
LDI r3, 84
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
