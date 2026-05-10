; DESCRIPTION: Renders a purple box of size 57x36 starting at (237, 43).
; PLAN: r0=237(x), r1=43(y), r2=57(width), r3=36(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 43
LDI r2, 57
LDI r3, 36
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
