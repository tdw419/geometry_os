; DESCRIPTION: Renders a purple box of size 55x22 starting at (424, 115).
; PLAN: r0=424(x), r1=115(y), r2=55(width), r3=22(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 115
LDI r2, 55
LDI r3, 22
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
