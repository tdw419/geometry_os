; DESCRIPTION: Renders a purple box of size 38x115 starting at (219, 25).
; PLAN: r0=219(x), r1=25(y), r2=38(width), r3=115(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 25
LDI r2, 38
LDI r3, 115
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
