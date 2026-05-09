; DESCRIPTION: Renders a purple box of size 82x68 starting at (321, 18).
; PLAN: r0=321(x), r1=18(y), r2=82(width), r3=68(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 18
LDI r2, 82
LDI r3, 68
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
