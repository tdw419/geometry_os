; DESCRIPTION: Renders a purple box of size 115x47 starting at (257, 134).
; PLAN: r0=257(x), r1=134(y), r2=115(width), r3=47(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 134
LDI r2, 115
LDI r3, 47
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
