; DESCRIPTION: Renders a purple box of size 41x53 starting at (26, 154).
; PLAN: r0=26(x), r1=154(y), r2=41(width), r3=53(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 154
LDI r2, 41
LDI r3, 53
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
