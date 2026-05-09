; DESCRIPTION: Renders a purple box of size 37x72 starting at (288, 90).
; PLAN: r0=288(x), r1=90(y), r2=37(width), r3=72(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 90
LDI r2, 37
LDI r3, 72
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
