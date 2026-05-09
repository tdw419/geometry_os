; DESCRIPTION: Renders a black box of size 87x21 starting at (134, 55).
; PLAN: r0=134(x), r1=55(y), r2=87(width), r3=21(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 55
LDI r2, 87
LDI r3, 21
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
