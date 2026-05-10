; DESCRIPTION: Renders a purple rectangular region spanning 39 by 32 at (190, 96).
; PLAN: r0=190(x), r1=96(y), r2=39(width), r3=32(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 96
LDI r2, 39
LDI r3, 32
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
