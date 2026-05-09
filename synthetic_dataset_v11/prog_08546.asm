; DESCRIPTION: Renders a purple box of size 57x10 starting at (145, 168).
; PLAN: r0=145(x), r1=168(y), r2=57(width), r3=10(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 168
LDI r2, 57
LDI r3, 10
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
