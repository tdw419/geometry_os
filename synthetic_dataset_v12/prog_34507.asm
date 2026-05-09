; DESCRIPTION: Renders a orange box of size 40x84 starting at (247, 52).
; PLAN: r0=247(x), r1=52(y), r2=40(width), r3=84(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 52
LDI r2, 40
LDI r3, 84
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
