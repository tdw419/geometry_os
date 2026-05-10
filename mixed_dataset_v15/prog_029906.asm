; DESCRIPTION: Renders a purple box of size 70x45 starting at (442, 68).
; PLAN: r0=442(x), r1=68(y), r2=70(width), r3=45(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 68
LDI r2, 70
LDI r3, 45
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
