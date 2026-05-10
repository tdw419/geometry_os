; DESCRIPTION: Renders a purple box of size 52x74 starting at (239, 62).
; PLAN: r0=239(x), r1=62(y), r2=52(width), r3=74(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 62
LDI r2, 52
LDI r3, 74
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
