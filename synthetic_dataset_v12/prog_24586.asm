; DESCRIPTION: Renders a blue box of size 20x23 starting at (380, 53).
; PLAN: r0=380(x), r1=53(y), r2=20(width), r3=23(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 53
LDI r2, 20
LDI r3, 23
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
