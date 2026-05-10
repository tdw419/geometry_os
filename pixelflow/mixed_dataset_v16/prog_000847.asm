; DESCRIPTION: Renders a orange box of size 105x31 starting at (323, 47).
; PLAN: r0=323(x), r1=47(y), r2=105(width), r3=31(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 47
LDI r2, 105
LDI r3, 31
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
