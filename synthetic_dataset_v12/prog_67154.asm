; DESCRIPTION: Renders a green box of size 19x45 starting at (341, 35).
; PLAN: r0=341(x), r1=35(y), r2=19(width), r3=45(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 35
LDI r2, 19
LDI r3, 45
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
