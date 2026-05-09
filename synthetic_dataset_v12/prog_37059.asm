; DESCRIPTION: Renders a purple box of size 11x64 starting at (486, 37).
; PLAN: r0=486(x), r1=37(y), r2=11(width), r3=64(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 486
LDI r1, 37
LDI r2, 11
LDI r3, 64
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
