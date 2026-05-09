; DESCRIPTION: Creates a purple rectangular region at (279, 189) spanning 32 by 52 pixels.
; PLAN: r0=279(x), r1=189(y), r2=32(width), r3=52(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 189
LDI r2, 32
LDI r3, 52
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
