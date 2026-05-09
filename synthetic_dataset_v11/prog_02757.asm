; DESCRIPTION: Renders a purple box of size 114x45 starting at (37, 171).
; PLAN: r0=37(x), r1=171(y), r2=114(width), r3=45(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 171
LDI r2, 114
LDI r3, 45
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
