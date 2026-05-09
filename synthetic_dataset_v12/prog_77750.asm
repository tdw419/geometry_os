; DESCRIPTION: Renders a purple box of size 87x96 starting at (406, 95).
; PLAN: r0=406(x), r1=95(y), r2=87(width), r3=96(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 95
LDI r2, 87
LDI r3, 96
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
