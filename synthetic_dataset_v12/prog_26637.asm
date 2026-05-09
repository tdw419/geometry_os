; DESCRIPTION: Renders a purple box of size 24x65 starting at (317, 142).
; PLAN: r0=317(x), r1=142(y), r2=24(width), r3=65(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 142
LDI r2, 24
LDI r3, 65
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
