; DESCRIPTION: Renders a purple box of size 66x58 starting at (59, 115).
; PLAN: r0=59(x), r1=115(y), r2=66(width), r3=58(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 115
LDI r2, 66
LDI r3, 58
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
