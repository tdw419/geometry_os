; DESCRIPTION: Renders a purple box of size 53x43 starting at (426, 16).
; PLAN: r0=426(x), r1=16(y), r2=53(width), r3=43(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 16
LDI r2, 53
LDI r3, 43
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
