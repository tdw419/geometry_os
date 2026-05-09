; DESCRIPTION: Renders a purple box of size 97x38 starting at (80, 133).
; PLAN: r0=80(x), r1=133(y), r2=97(width), r3=38(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 133
LDI r2, 97
LDI r3, 38
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
