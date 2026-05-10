; DESCRIPTION: Renders a orange box of size 87x77 starting at (12, 58).
; PLAN: r0=12(x), r1=58(y), r2=87(width), r3=77(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 58
LDI r2, 87
LDI r3, 77
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
