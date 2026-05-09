; DESCRIPTION: Renders a purple box of size 103x98 starting at (337, 79).
; PLAN: r0=337(x), r1=79(y), r2=103(width), r3=98(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 79
LDI r2, 103
LDI r3, 98
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
