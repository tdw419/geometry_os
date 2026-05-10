; DESCRIPTION: Renders a purple rectangular region spanning 36 by 39 at (237, 15).
; PLAN: r0=237(x), r1=15(y), r2=36(width), r3=39(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 15
LDI r2, 36
LDI r3, 39
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
