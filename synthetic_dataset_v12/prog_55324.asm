; DESCRIPTION: Renders a purple box of size 97x36 starting at (125, 120).
; PLAN: r0=125(x), r1=120(y), r2=97(width), r3=36(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 120
LDI r2, 97
LDI r3, 36
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
