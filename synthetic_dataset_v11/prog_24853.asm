; DESCRIPTION: Renders a purple box of size 115x10 starting at (24, 220).
; PLAN: r0=24(x), r1=220(y), r2=115(width), r3=10(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 220
LDI r2, 115
LDI r3, 10
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
