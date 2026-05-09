; DESCRIPTION: Renders a purple box of size 65x92 starting at (43, 143).
; PLAN: r0=43(x), r1=143(y), r2=65(width), r3=92(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 143
LDI r2, 65
LDI r3, 92
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
