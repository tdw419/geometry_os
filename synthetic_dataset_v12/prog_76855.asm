; DESCRIPTION: Renders a purple box of size 111x61 starting at (124, 24).
; PLAN: r0=124(x), r1=24(y), r2=111(width), r3=61(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 24
LDI r2, 111
LDI r3, 61
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
