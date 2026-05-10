; DESCRIPTION: Renders a black box of size 87x98 starting at (10, 102).
; PLAN: r0=10(x), r1=102(y), r2=87(width), r3=98(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 102
LDI r2, 87
LDI r3, 98
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
