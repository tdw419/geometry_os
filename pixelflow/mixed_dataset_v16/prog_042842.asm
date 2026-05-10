; DESCRIPTION: Renders a purple box of size 92x38 starting at (5, 36).
; PLAN: r0=5(x), r1=36(y), r2=92(width), r3=38(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 36
LDI r2, 92
LDI r3, 38
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
