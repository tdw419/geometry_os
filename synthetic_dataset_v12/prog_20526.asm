; DESCRIPTION: Renders a purple box of size 103x95 starting at (190, 3).
; PLAN: r0=190(x), r1=3(y), r2=103(width), r3=95(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 3
LDI r2, 103
LDI r3, 95
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
