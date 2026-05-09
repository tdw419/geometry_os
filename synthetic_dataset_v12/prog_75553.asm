; DESCRIPTION: Renders a orange box of size 77x16 starting at (130, 26).
; PLAN: r0=130(x), r1=26(y), r2=77(width), r3=16(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 26
LDI r2, 77
LDI r3, 16
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
