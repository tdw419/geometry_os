; DESCRIPTION: Renders a purple box of size 10x70 starting at (95, 132).
; PLAN: r0=95(x), r1=132(y), r2=10(width), r3=70(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 132
LDI r2, 10
LDI r3, 70
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
