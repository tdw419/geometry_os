; DESCRIPTION: Renders a purple box of size 112x60 starting at (374, 4).
; PLAN: r0=374(x), r1=4(y), r2=112(width), r3=60(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 4
LDI r2, 112
LDI r3, 60
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
