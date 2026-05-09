; DESCRIPTION: Renders a purple box of size 92x46 starting at (22, 197).
; PLAN: r0=22(x), r1=197(y), r2=92(width), r3=46(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 197
LDI r2, 92
LDI r3, 46
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
