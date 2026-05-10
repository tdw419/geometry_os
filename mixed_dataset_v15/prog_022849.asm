; DESCRIPTION: Renders a orange box of size 12x93 starting at (11, 0).
; PLAN: r0=11(x), r1=0(y), r2=12(width), r3=93(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 0
LDI r2, 12
LDI r3, 93
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
