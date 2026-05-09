; DESCRIPTION: Creates a purple rectangular region at (164, 177) spanning 14 by 24 pixels.
; PLAN: r0=164(x), r1=177(y), r2=14(width), r3=24(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 177
LDI r2, 14
LDI r3, 24
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
