; DESCRIPTION: Renders a purple box of size 105x45 starting at (68, 161).
; PLAN: r0=68(x), r1=161(y), r2=105(width), r3=45(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 161
LDI r2, 105
LDI r3, 45
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
