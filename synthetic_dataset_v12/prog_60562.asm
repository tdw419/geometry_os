; DESCRIPTION: Renders a orange box of size 28x97 starting at (126, 10).
; PLAN: r0=126(x), r1=10(y), r2=28(width), r3=97(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 10
LDI r2, 28
LDI r3, 97
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
