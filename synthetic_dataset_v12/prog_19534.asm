; DESCRIPTION: Renders a purple box of size 72x80 starting at (417, 0).
; PLAN: r0=417(x), r1=0(y), r2=72(width), r3=80(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 0
LDI r2, 72
LDI r3, 80
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
