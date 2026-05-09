; DESCRIPTION: Renders a black box of size 85x80 starting at (279, 101).
; PLAN: r0=279(x), r1=101(y), r2=85(width), r3=80(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 101
LDI r2, 85
LDI r3, 80
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
