; DESCRIPTION: Renders a purple box of size 26x115 starting at (263, 22).
; PLAN: r0=263(x), r1=22(y), r2=26(width), r3=115(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 22
LDI r2, 26
LDI r3, 115
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
