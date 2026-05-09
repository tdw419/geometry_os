; DESCRIPTION: Renders a purple box of size 117x45 starting at (233, 82).
; PLAN: r0=233(x), r1=82(y), r2=117(width), r3=45(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 82
LDI r2, 117
LDI r3, 45
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
