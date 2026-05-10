; DESCRIPTION: Renders a purple box of size 92x73 starting at (112, 154).
; PLAN: r0=112(x), r1=154(y), r2=92(width), r3=73(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 154
LDI r2, 92
LDI r3, 73
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
