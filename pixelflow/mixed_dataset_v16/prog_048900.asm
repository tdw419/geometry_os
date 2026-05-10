; DESCRIPTION: Renders a purple box of size 54x55 starting at (114, 115).
; PLAN: r0=114(x), r1=115(y), r2=54(width), r3=55(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 115
LDI r2, 54
LDI r3, 55
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
