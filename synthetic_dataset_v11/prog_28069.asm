; DESCRIPTION: Renders a purple box of size 103x89 starting at (119, 152).
; PLAN: r0=119(x), r1=152(y), r2=103(width), r3=89(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 152
LDI r2, 103
LDI r3, 89
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
