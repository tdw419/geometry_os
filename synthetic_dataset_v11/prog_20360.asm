; DESCRIPTION: Renders a purple box of size 30x31 starting at (189, 159).
; PLAN: r0=189(x), r1=159(y), r2=30(width), r3=31(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 159
LDI r2, 30
LDI r3, 31
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
