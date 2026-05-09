; DESCRIPTION: Renders a blue box of size 45x39 starting at (18, 0).
; PLAN: r0=18(x), r1=0(y), r2=45(width), r3=39(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 0
LDI r2, 45
LDI r3, 39
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
