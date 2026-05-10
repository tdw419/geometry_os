; DESCRIPTION: Renders a purple box of size 81x113 starting at (336, 95).
; PLAN: r0=336(x), r1=95(y), r2=81(width), r3=113(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 95
LDI r2, 81
LDI r3, 113
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
