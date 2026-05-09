; DESCRIPTION: Renders a green box of size 119x53 starting at (45, 17).
; PLAN: r0=45(x), r1=17(y), r2=119(width), r3=53(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 17
LDI r2, 119
LDI r3, 53
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
