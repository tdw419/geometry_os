; DESCRIPTION: Renders a black box of size 46x87 starting at (461, 132).
; PLAN: r0=461(x), r1=132(y), r2=46(width), r3=87(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 461
LDI r1, 132
LDI r2, 46
LDI r3, 87
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
