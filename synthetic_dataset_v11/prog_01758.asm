; DESCRIPTION: Renders a purple box of size 98x60 starting at (118, 36).
; PLAN: r0=118(x), r1=36(y), r2=98(width), r3=60(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 36
LDI r2, 98
LDI r3, 60
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
