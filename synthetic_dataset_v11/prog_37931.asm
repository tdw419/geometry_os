; DESCRIPTION: Renders a orange box of size 11x11 starting at (224, 114).
; PLAN: r0=224(x), r1=114(y), r2=11(width), r3=11(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 114
LDI r2, 11
LDI r3, 11
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
