; DESCRIPTION: Renders a purple box of size 92x74 starting at (177, 55).
; PLAN: r0=177(x), r1=55(y), r2=92(width), r3=74(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 55
LDI r2, 92
LDI r3, 74
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
