; DESCRIPTION: Renders a orange box of size 56x50 starting at (18, 138).
; PLAN: r0=18(x), r1=138(y), r2=56(width), r3=50(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 138
LDI r2, 56
LDI r3, 50
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
