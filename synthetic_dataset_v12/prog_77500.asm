; DESCRIPTION: Renders a purple box of size 25x116 starting at (373, 3).
; PLAN: r0=373(x), r1=3(y), r2=25(width), r3=116(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 3
LDI r2, 25
LDI r3, 116
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
