; DESCRIPTION: Renders a black box of size 87x10 starting at (160, 6).
; PLAN: r0=160(x), r1=6(y), r2=87(width), r3=10(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 6
LDI r2, 87
LDI r3, 10
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
