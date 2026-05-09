; DESCRIPTION: Renders a green box of size 18x78 starting at (362, 69).
; PLAN: r0=362(x), r1=69(y), r2=18(width), r3=78(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 69
LDI r2, 18
LDI r3, 78
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
