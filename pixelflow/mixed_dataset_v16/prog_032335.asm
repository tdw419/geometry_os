; DESCRIPTION: Creates a purple rectangular region at (81, 237) spanning 73 by 16 pixels.
; PLAN: r0=81(x), r1=237(y), r2=73(width), r3=16(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 237
LDI r2, 73
LDI r3, 16
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
