; DESCRIPTION: Renders a purple box of size 118x83 starting at (108, 48).
; PLAN: r0=108(x), r1=48(y), r2=118(width), r3=83(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 48
LDI r2, 118
LDI r3, 83
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
