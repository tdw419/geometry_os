; DESCRIPTION: Renders a purple box of size 61x21 starting at (431, 112).
; PLAN: r0=431(x), r1=112(y), r2=61(width), r3=21(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 112
LDI r2, 61
LDI r3, 21
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
