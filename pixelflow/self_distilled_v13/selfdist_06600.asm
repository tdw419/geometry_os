; DESCRIPTION: Renders a purple rectangular region spanning 96 by 55 at (288, 120).
; PLAN: r0=288(x), r1=120(y), r2=96(width), r3=55(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 120
LDI r2, 96
LDI r3, 55
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
