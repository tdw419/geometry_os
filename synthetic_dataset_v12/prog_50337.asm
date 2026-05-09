; DESCRIPTION: Creates a purple rectangular region at (372, 71) spanning 82 by 73 pixels.
; PLAN: r0=372(x), r1=71(y), r2=82(width), r3=73(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 71
LDI r2, 82
LDI r3, 73
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
