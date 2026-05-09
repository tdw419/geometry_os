; DESCRIPTION: Renders a orange box of size 83x24 starting at (421, 36).
; PLAN: r0=421(x), r1=36(y), r2=83(width), r3=24(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 36
LDI r2, 83
LDI r3, 24
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
