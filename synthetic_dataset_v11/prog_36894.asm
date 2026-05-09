; DESCRIPTION: Renders a purple box of size 71x120 starting at (101, 127).
; PLAN: r0=101(x), r1=127(y), r2=71(width), r3=120(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 127
LDI r2, 71
LDI r3, 120
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
