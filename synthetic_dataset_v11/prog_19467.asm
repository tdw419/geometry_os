; DESCRIPTION: Renders a green box of size 35x37 starting at (215, 69).
; PLAN: r0=215(x), r1=69(y), r2=35(width), r3=37(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 69
LDI r2, 35
LDI r3, 37
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
