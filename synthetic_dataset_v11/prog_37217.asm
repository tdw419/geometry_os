; DESCRIPTION: Renders a purple box of size 102x31 starting at (40, 202).
; PLAN: r0=40(x), r1=202(y), r2=102(width), r3=31(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 202
LDI r2, 102
LDI r3, 31
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
