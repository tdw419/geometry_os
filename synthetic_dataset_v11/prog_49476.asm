; DESCRIPTION: Renders a purple box of size 96x80 starting at (21, 142).
; PLAN: r0=21(x), r1=142(y), r2=96(width), r3=80(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 142
LDI r2, 96
LDI r3, 80
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
