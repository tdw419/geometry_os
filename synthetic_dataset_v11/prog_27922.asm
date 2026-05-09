; DESCRIPTION: Renders a purple box of size 120x119 starting at (48, 63).
; PLAN: r0=48(x), r1=63(y), r2=120(width), r3=119(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 63
LDI r2, 120
LDI r3, 119
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
