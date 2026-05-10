; DESCRIPTION: Renders a purple box of size 92x83 starting at (210, 170).
; PLAN: r0=210(x), r1=170(y), r2=92(width), r3=83(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 170
LDI r2, 92
LDI r3, 83
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
