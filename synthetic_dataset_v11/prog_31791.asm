; DESCRIPTION: Creates a purple rectangular region at (114, 82) spanning 93 by 52 pixels.
; PLAN: r0=114(x), r1=82(y), r2=93(width), r3=52(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 82
LDI r2, 93
LDI r3, 52
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
