; DESCRIPTION: Renders a orange box of size 52x60 starting at (47, 7).
; PLAN: r0=47(x), r1=7(y), r2=52(width), r3=60(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 7
LDI r2, 52
LDI r3, 60
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
