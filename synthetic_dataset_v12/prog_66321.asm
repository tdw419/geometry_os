; DESCRIPTION: Renders a purple box of size 102x52 starting at (115, 197).
; PLAN: r0=115(x), r1=197(y), r2=102(width), r3=52(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 197
LDI r2, 102
LDI r3, 52
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
