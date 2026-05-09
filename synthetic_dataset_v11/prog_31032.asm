; DESCRIPTION: Renders a orange box of size 95x30 starting at (78, 63).
; PLAN: r0=78(x), r1=63(y), r2=95(width), r3=30(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 63
LDI r2, 95
LDI r3, 30
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
