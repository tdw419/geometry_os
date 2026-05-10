; DESCRIPTION: Renders a purple box of size 112x43 starting at (237, 210).
; PLAN: r0=237(x), r1=210(y), r2=112(width), r3=43(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 210
LDI r2, 112
LDI r3, 43
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
