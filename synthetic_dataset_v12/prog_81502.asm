; DESCRIPTION: Renders a purple box of size 52x32 starting at (204, 121).
; PLAN: r0=204(x), r1=121(y), r2=52(width), r3=32(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 121
LDI r2, 52
LDI r3, 32
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
