; DESCRIPTION: Renders a purple box of size 84x44 starting at (379, 153).
; PLAN: r0=379(x), r1=153(y), r2=84(width), r3=44(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 153
LDI r2, 84
LDI r3, 44
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
