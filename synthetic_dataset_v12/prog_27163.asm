; DESCRIPTION: Renders a purple box of size 115x96 starting at (231, 48).
; PLAN: r0=231(x), r1=48(y), r2=115(width), r3=96(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 48
LDI r2, 115
LDI r3, 96
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
