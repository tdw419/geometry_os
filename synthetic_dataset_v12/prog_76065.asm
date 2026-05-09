; DESCRIPTION: Renders a purple box of size 40x53 starting at (374, 114).
; PLAN: r0=374(x), r1=114(y), r2=40(width), r3=53(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 114
LDI r2, 40
LDI r3, 53
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
