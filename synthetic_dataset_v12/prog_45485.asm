; DESCRIPTION: Renders a purple box of size 31x74 starting at (184, 23).
; PLAN: r0=184(x), r1=23(y), r2=31(width), r3=74(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 23
LDI r2, 31
LDI r3, 74
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
