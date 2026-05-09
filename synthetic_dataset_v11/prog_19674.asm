; DESCRIPTION: Renders a purple box of size 68x45 starting at (47, 133).
; PLAN: r0=47(x), r1=133(y), r2=68(width), r3=45(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 133
LDI r2, 68
LDI r3, 45
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
