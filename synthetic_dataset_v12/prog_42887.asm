; DESCRIPTION: Renders a purple box of size 98x21 starting at (82, 45).
; PLAN: r0=82(x), r1=45(y), r2=98(width), r3=21(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 45
LDI r2, 98
LDI r3, 21
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
