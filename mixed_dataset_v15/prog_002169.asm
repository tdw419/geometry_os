; DESCRIPTION: Renders a purple box of size 18x49 starting at (468, 139).
; PLAN: r0=468(x), r1=139(y), r2=18(width), r3=49(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 468
LDI r1, 139
LDI r2, 18
LDI r3, 49
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
