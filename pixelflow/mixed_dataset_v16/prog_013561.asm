; DESCRIPTION: Renders a red box of size 21x18 starting at (159, 43).
; PLAN: r0=159(x), r1=43(y), r2=21(width), r3=18(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 43
LDI r2, 21
LDI r3, 18
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
