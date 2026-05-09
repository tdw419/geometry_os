; DESCRIPTION: Renders a purple box of size 16x63 starting at (71, 19).
; PLAN: r0=71(x), r1=19(y), r2=16(width), r3=63(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 19
LDI r2, 16
LDI r3, 63
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
