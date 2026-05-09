; DESCRIPTION: Renders a purple box of size 87x76 starting at (197, 90).
; PLAN: r0=197(x), r1=90(y), r2=87(width), r3=76(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 90
LDI r2, 87
LDI r3, 76
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
