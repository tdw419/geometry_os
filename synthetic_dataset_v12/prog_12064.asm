; DESCRIPTION: Renders a purple box of size 109x57 starting at (400, 81).
; PLAN: r0=400(x), r1=81(y), r2=109(width), r3=57(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 81
LDI r2, 109
LDI r3, 57
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
