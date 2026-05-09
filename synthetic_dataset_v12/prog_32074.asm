; DESCRIPTION: Renders a purple box of size 96x92 starting at (301, 116).
; PLAN: r0=301(x), r1=116(y), r2=96(width), r3=92(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 116
LDI r2, 96
LDI r3, 92
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
