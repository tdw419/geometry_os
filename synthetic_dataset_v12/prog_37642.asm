; DESCRIPTION: Renders a orange box of size 105x87 starting at (247, 141).
; PLAN: r0=247(x), r1=141(y), r2=105(width), r3=87(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 141
LDI r2, 105
LDI r3, 87
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
