; DESCRIPTION: Renders a orange box of size 73x108 starting at (418, 72).
; PLAN: r0=418(x), r1=72(y), r2=73(width), r3=108(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 72
LDI r2, 73
LDI r3, 108
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
