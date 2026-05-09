; DESCRIPTION: Renders a purple box of size 16x72 starting at (75, 141).
; PLAN: r0=75(x), r1=141(y), r2=16(width), r3=72(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 141
LDI r2, 16
LDI r3, 72
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
