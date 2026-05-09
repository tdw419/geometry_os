; DESCRIPTION: Renders a purple box of size 106x115 starting at (102, 76).
; PLAN: r0=102(x), r1=76(y), r2=106(width), r3=115(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 76
LDI r2, 106
LDI r3, 115
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
