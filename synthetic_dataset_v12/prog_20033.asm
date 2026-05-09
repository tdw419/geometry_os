; DESCRIPTION: Renders a orange box of size 15x91 starting at (421, 13).
; PLAN: r0=421(x), r1=13(y), r2=15(width), r3=91(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 13
LDI r2, 15
LDI r3, 91
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
