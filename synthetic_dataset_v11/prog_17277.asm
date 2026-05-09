; DESCRIPTION: Renders a black box of size 25x80 starting at (53, 19).
; PLAN: r0=53(x), r1=19(y), r2=25(width), r3=80(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 19
LDI r2, 25
LDI r3, 80
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
