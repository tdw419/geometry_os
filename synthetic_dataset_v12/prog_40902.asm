; DESCRIPTION: Renders a purple box of size 93x111 starting at (118, 117).
; PLAN: r0=118(x), r1=117(y), r2=93(width), r3=111(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 117
LDI r2, 93
LDI r3, 111
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
