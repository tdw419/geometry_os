; DESCRIPTION: Renders a purple box of size 66x53 starting at (273, 109).
; PLAN: r0=273(x), r1=109(y), r2=66(width), r3=53(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 109
LDI r2, 66
LDI r3, 53
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
