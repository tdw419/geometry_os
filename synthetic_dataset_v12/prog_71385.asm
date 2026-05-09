; DESCRIPTION: Renders a orange box of size 20x20 starting at (459, 23).
; PLAN: r0=459(x), r1=23(y), r2=20(width), r3=20(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 459
LDI r1, 23
LDI r2, 20
LDI r3, 20
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
