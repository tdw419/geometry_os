; DESCRIPTION: Renders a black box of size 46x85 starting at (66, 20).
; PLAN: r0=66(x), r1=20(y), r2=46(width), r3=85(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 20
LDI r2, 46
LDI r3, 85
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
