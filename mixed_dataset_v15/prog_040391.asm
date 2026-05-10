; DESCRIPTION: Renders a purple box of size 10x26 starting at (71, 54).
; PLAN: r0=71(x), r1=54(y), r2=10(width), r3=26(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 54
LDI r2, 10
LDI r3, 26
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
