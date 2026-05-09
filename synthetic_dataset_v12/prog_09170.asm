; DESCRIPTION: Creates a purple rectangular region at (16, 112) spanning 82 by 69 pixels.
; PLAN: r0=16(x), r1=112(y), r2=82(width), r3=69(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 112
LDI r2, 82
LDI r3, 69
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
