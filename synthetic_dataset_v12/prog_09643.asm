; DESCRIPTION: Renders a black box of size 87x68 starting at (20, 132).
; PLAN: r0=20(x), r1=132(y), r2=87(width), r3=68(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 132
LDI r2, 87
LDI r3, 68
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
