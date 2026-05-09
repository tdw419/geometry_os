; DESCRIPTION: Renders a purple box of size 48x48 starting at (3, 119).
; PLAN: r0=3(x), r1=119(y), r2=48(width), r3=48(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 119
LDI r2, 48
LDI r3, 48
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
