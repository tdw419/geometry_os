; DESCRIPTION: Renders a purple box of size 15x36 starting at (189, 47).
; PLAN: r0=189(x), r1=47(y), r2=15(width), r3=36(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 47
LDI r2, 15
LDI r3, 36
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
