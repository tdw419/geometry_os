; DESCRIPTION: Renders a purple box of size 53x25 starting at (159, 210).
; PLAN: r0=159(x), r1=210(y), r2=53(width), r3=25(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 210
LDI r2, 53
LDI r3, 25
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
