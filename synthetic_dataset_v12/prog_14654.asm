; DESCRIPTION: Renders a purple box of size 63x33 starting at (177, 30).
; PLAN: r0=177(x), r1=30(y), r2=63(width), r3=33(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 30
LDI r2, 63
LDI r3, 33
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
