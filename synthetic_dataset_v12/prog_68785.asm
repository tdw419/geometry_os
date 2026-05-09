; DESCRIPTION: Renders a purple box of size 93x103 starting at (241, 11).
; PLAN: r0=241(x), r1=11(y), r2=93(width), r3=103(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 11
LDI r2, 93
LDI r3, 103
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
