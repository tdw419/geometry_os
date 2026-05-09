; DESCRIPTION: Renders a purple box of size 76x68 starting at (185, 108).
; PLAN: r0=185(x), r1=108(y), r2=76(width), r3=68(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 108
LDI r2, 76
LDI r3, 68
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
