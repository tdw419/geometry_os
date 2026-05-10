; DESCRIPTION: Renders a purple box of size 42x29 starting at (240, 66).
; PLAN: r0=240(x), r1=66(y), r2=42(width), r3=29(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 66
LDI r2, 42
LDI r3, 29
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
