; DESCRIPTION: Renders a purple box of size 16x116 starting at (190, 9).
; PLAN: r0=190(x), r1=9(y), r2=16(width), r3=116(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 9
LDI r2, 16
LDI r3, 116
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
