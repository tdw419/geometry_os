; DESCRIPTION: Renders a purple box of size 106x90 starting at (300, 138).
; PLAN: r0=300(x), r1=138(y), r2=106(width), r3=90(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 138
LDI r2, 106
LDI r3, 90
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
