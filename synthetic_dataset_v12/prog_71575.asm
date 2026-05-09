; DESCRIPTION: Renders a purple box of size 113x64 starting at (318, 52).
; PLAN: r0=318(x), r1=52(y), r2=113(width), r3=64(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 52
LDI r2, 113
LDI r3, 64
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
