; DESCRIPTION: Renders a purple box of size 57x82 starting at (102, 165).
; PLAN: r0=102(x), r1=165(y), r2=57(width), r3=82(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 165
LDI r2, 57
LDI r3, 82
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
