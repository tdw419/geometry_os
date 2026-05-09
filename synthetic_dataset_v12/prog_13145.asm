; DESCRIPTION: Renders a orange box of size 22x31 starting at (0, 26).
; PLAN: r0=0(x), r1=26(y), r2=22(width), r3=31(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 26
LDI r2, 22
LDI r3, 31
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
