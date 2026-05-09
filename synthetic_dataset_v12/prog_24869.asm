; DESCRIPTION: Renders a purple box of size 101x110 starting at (411, 120).
; PLAN: r0=411(x), r1=120(y), r2=101(width), r3=110(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 120
LDI r2, 101
LDI r3, 110
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
