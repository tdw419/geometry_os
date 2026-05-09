; DESCRIPTION: Renders a purple box of size 112x103 starting at (40, 137).
; PLAN: r0=40(x), r1=137(y), r2=112(width), r3=103(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 137
LDI r2, 112
LDI r3, 103
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
