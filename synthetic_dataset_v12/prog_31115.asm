; DESCRIPTION: Renders a purple box of size 66x70 starting at (202, 77).
; PLAN: r0=202(x), r1=77(y), r2=66(width), r3=70(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 77
LDI r2, 66
LDI r3, 70
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
