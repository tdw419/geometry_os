; DESCRIPTION: Renders a orange box of size 85x90 starting at (409, 101).
; PLAN: r0=409(x), r1=101(y), r2=85(width), r3=90(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 101
LDI r2, 85
LDI r3, 90
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
