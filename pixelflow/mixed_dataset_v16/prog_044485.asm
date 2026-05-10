; DESCRIPTION: Renders a purple box of size 17x92 starting at (300, 132).
; PLAN: r0=300(x), r1=132(y), r2=17(width), r3=92(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 132
LDI r2, 17
LDI r3, 92
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
