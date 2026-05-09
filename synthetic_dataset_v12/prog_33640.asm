; DESCRIPTION: Renders a orange box of size 56x22 starting at (272, 141).
; PLAN: r0=272(x), r1=141(y), r2=56(width), r3=22(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 141
LDI r2, 56
LDI r3, 22
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
