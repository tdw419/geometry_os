; DESCRIPTION: Renders a purple box of size 106x28 starting at (31, 31).
; PLAN: r0=31(x), r1=31(y), r2=106(width), r3=28(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 31
LDI r2, 106
LDI r3, 28
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
