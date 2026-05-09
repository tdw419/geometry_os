; DESCRIPTION: Renders a purple box of size 59x96 starting at (241, 60).
; PLAN: r0=241(x), r1=60(y), r2=59(width), r3=96(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 60
LDI r2, 59
LDI r3, 96
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
