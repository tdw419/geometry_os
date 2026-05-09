; DESCRIPTION: Renders a purple box of size 89x48 starting at (388, 178).
; PLAN: r0=388(x), r1=178(y), r2=89(width), r3=48(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 178
LDI r2, 89
LDI r3, 48
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
