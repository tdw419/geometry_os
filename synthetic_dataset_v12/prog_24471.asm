; DESCRIPTION: Renders a purple box of size 38x102 starting at (274, 18).
; PLAN: r0=274(x), r1=18(y), r2=38(width), r3=102(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 18
LDI r2, 38
LDI r3, 102
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
