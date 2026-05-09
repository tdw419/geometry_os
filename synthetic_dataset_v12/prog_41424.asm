; DESCRIPTION: Renders a purple box of size 57x120 starting at (13, 53).
; PLAN: r0=13(x), r1=53(y), r2=57(width), r3=120(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 53
LDI r2, 57
LDI r3, 120
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
