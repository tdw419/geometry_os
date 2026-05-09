; DESCRIPTION: Renders a orange box of size 11x44 starting at (425, 191).
; PLAN: r0=425(x), r1=191(y), r2=11(width), r3=44(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 191
LDI r2, 11
LDI r3, 44
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
