; DESCRIPTION: Renders a purple box of size 83x90 starting at (271, 141).
; PLAN: r0=271(x), r1=141(y), r2=83(width), r3=90(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 141
LDI r2, 83
LDI r3, 90
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
