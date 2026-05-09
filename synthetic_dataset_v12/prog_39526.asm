; DESCRIPTION: Creates a purple rectangular region at (293, 39) spanning 32 by 32 pixels.
; PLAN: r0=293(x), r1=39(y), r2=32(width), r3=32(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 39
LDI r2, 32
LDI r3, 32
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
