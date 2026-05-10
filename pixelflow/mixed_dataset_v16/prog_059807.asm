; DESCRIPTION: Renders a orange box of size 40x91 starting at (144, 100).
; PLAN: r0=144(x), r1=100(y), r2=40(width), r3=91(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 100
LDI r2, 40
LDI r3, 91
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
