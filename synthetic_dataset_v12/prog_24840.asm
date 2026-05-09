; DESCRIPTION: Renders a purple box of size 49x75 starting at (210, 55).
; PLAN: r0=210(x), r1=55(y), r2=49(width), r3=75(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 55
LDI r2, 49
LDI r3, 75
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
