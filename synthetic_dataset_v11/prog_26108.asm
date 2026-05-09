; DESCRIPTION: Renders a purple box of size 23x87 starting at (179, 60).
; PLAN: r0=179(x), r1=60(y), r2=23(width), r3=87(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 60
LDI r2, 23
LDI r3, 87
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
