; DESCRIPTION: Renders a purple rectangular region spanning 112 by 58 at (154, 162).
; PLAN: r0=154(x), r1=162(y), r2=112(width), r3=58(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 162
LDI r2, 112
LDI r3, 58
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
