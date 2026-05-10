; DESCRIPTION: Renders a purple box of size 90x36 starting at (381, 107).
; PLAN: r0=381(x), r1=107(y), r2=90(width), r3=36(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 107
LDI r2, 90
LDI r3, 36
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
