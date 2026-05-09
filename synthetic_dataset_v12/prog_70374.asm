; DESCRIPTION: Renders a black box of size 11x48 starting at (193, 78).
; PLAN: r0=193(x), r1=78(y), r2=11(width), r3=48(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 78
LDI r2, 11
LDI r3, 48
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
