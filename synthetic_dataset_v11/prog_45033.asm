; DESCRIPTION: Renders a purple box of size 120x70 starting at (73, 175).
; PLAN: r0=73(x), r1=175(y), r2=120(width), r3=70(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 175
LDI r2, 120
LDI r3, 70
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
