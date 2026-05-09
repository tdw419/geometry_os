; DESCRIPTION: Renders a orange box of size 63x19 starting at (80, 122).
; PLAN: r0=80(x), r1=122(y), r2=63(width), r3=19(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 122
LDI r2, 63
LDI r3, 19
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
