; DESCRIPTION: Renders a purple box of size 72x44 starting at (38, 181).
; PLAN: r0=38(x), r1=181(y), r2=72(width), r3=44(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 181
LDI r2, 72
LDI r3, 44
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
