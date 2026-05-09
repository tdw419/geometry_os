; DESCRIPTION: Renders a orange box of size 116x47 starting at (37, 176).
; PLAN: r0=37(x), r1=176(y), r2=116(width), r3=47(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 176
LDI r2, 116
LDI r3, 47
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
