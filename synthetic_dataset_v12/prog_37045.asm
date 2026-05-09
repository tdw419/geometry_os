; DESCRIPTION: Renders a orange box of size 21x84 starting at (491, 158).
; PLAN: r0=491(x), r1=158(y), r2=21(width), r3=84(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 491
LDI r1, 158
LDI r2, 21
LDI r3, 84
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
