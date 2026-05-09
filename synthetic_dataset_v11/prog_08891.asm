; DESCRIPTION: Creates a purple rectangular region at (135, 57) spanning 82 by 106 pixels.
; PLAN: r0=135(x), r1=57(y), r2=82(width), r3=106(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 57
LDI r2, 82
LDI r3, 106
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
