; DESCRIPTION: Renders a purple box of size 52x72 starting at (269, 129).
; PLAN: r0=269(x), r1=129(y), r2=52(width), r3=72(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 129
LDI r2, 52
LDI r3, 72
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
