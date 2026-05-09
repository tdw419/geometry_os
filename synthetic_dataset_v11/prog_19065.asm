; DESCRIPTION: Renders a orange box of size 52x10 starting at (126, 189).
; PLAN: r0=126(x), r1=189(y), r2=52(width), r3=10(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 189
LDI r2, 52
LDI r3, 10
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
