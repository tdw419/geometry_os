; DESCRIPTION: Renders a purple box of size 11x30 starting at (446, 131).
; PLAN: r0=446(x), r1=131(y), r2=11(width), r3=30(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 131
LDI r2, 11
LDI r3, 30
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
