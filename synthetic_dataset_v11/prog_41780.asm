; DESCRIPTION: Renders a purple box of size 53x110 starting at (40, 29).
; PLAN: r0=40(x), r1=29(y), r2=53(width), r3=110(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 29
LDI r2, 53
LDI r3, 110
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
