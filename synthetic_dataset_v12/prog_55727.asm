; DESCRIPTION: Renders a purple box of size 93x72 starting at (349, 80).
; PLAN: r0=349(x), r1=80(y), r2=93(width), r3=72(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 80
LDI r2, 93
LDI r3, 72
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
