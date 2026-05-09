; DESCRIPTION: Renders a orange box of size 19x21 starting at (18, 126).
; PLAN: r0=18(x), r1=126(y), r2=19(width), r3=21(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 126
LDI r2, 19
LDI r3, 21
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
