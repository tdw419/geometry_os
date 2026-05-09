; DESCRIPTION: Renders a orange box of size 73x16 starting at (245, 43).
; PLAN: r0=245(x), r1=43(y), r2=73(width), r3=16(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 43
LDI r2, 73
LDI r3, 16
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
