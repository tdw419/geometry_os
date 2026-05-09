; DESCRIPTION: Renders a purple box of size 120x61 starting at (43, 183).
; PLAN: r0=43(x), r1=183(y), r2=120(width), r3=61(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 183
LDI r2, 120
LDI r3, 61
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
