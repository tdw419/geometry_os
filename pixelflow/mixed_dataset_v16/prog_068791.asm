; DESCRIPTION: Renders a purple box of size 10x63 starting at (251, 32).
; PLAN: r0=251(x), r1=32(y), r2=10(width), r3=63(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 32
LDI r2, 10
LDI r3, 63
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
