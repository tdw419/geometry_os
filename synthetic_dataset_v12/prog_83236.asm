; DESCRIPTION: Renders a orange box of size 77x11 starting at (82, 26).
; PLAN: r0=82(x), r1=26(y), r2=77(width), r3=11(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 26
LDI r2, 77
LDI r3, 11
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
