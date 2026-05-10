; DESCRIPTION: Renders a purple rectangular region spanning 45 by 29 at (341, 152).
; PLAN: r0=341(x), r1=152(y), r2=45(width), r3=29(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 152
LDI r2, 45
LDI r3, 29
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
