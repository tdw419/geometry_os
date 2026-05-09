; DESCRIPTION: Renders a purple box of size 35x109 starting at (38, 96).
; PLAN: r0=38(x), r1=96(y), r2=35(width), r3=109(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 96
LDI r2, 35
LDI r3, 109
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
