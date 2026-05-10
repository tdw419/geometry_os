; DESCRIPTION: Renders a purple box of size 106x47 starting at (77, 133).
; PLAN: r0=77(x), r1=133(y), r2=106(width), r3=47(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 133
LDI r2, 106
LDI r3, 47
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
