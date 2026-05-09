; DESCRIPTION: Renders a green box of size 69x31 starting at (424, 11).
; PLAN: r0=424(x), r1=11(y), r2=69(width), r3=31(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 11
LDI r2, 69
LDI r3, 31
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
