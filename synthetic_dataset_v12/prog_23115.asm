; DESCRIPTION: Renders a purple box of size 78x111 starting at (210, 74).
; PLAN: r0=210(x), r1=74(y), r2=78(width), r3=111(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 74
LDI r2, 78
LDI r3, 111
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
