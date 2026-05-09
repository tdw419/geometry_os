; DESCRIPTION: Renders a purple box of size 78x32 starting at (151, 5).
; PLAN: r0=151(x), r1=5(y), r2=78(width), r3=32(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 5
LDI r2, 78
LDI r3, 32
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
