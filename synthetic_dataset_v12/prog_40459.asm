; DESCRIPTION: Renders a blue box of size 10x45 starting at (98, 39).
; PLAN: r0=98(x), r1=39(y), r2=10(width), r3=45(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 39
LDI r2, 10
LDI r3, 45
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
