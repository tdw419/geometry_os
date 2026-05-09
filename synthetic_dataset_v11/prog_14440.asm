; DESCRIPTION: Renders a purple box of size 37x53 starting at (19, 193).
; PLAN: r0=19(x), r1=193(y), r2=37(width), r3=53(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 193
LDI r2, 37
LDI r3, 53
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
