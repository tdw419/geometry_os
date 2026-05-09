; DESCRIPTION: Renders a orange box of size 66x31 starting at (131, 30).
; PLAN: r0=131(x), r1=30(y), r2=66(width), r3=31(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 30
LDI r2, 66
LDI r3, 31
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
