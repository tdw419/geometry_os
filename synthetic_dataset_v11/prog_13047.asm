; DESCRIPTION: Renders a purple box of size 25x19 starting at (197, 129).
; PLAN: r0=197(x), r1=129(y), r2=25(width), r3=19(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 129
LDI r2, 25
LDI r3, 19
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
