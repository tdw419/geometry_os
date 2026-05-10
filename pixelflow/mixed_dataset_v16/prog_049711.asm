; DESCRIPTION: Creates a purple rectangular region at (234, 151) spanning 109 by 82 pixels.
; PLAN: r0=234(x), r1=151(y), r2=109(width), r3=82(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 151
LDI r2, 109
LDI r3, 82
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
