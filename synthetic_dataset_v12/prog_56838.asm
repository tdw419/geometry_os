; DESCRIPTION: Renders a black box of size 87x55 starting at (76, 126).
; PLAN: r0=76(x), r1=126(y), r2=87(width), r3=55(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 126
LDI r2, 87
LDI r3, 55
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
