; DESCRIPTION: Renders a purple box of size 53x62 starting at (270, 113).
; PLAN: r0=270(x), r1=113(y), r2=53(width), r3=62(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 113
LDI r2, 53
LDI r3, 62
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
