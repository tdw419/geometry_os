; DESCRIPTION: Creates a purple rectangular region at (446, 116) spanning 64 by 32 pixels.
; PLAN: r0=446(x), r1=116(y), r2=64(width), r3=32(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 116
LDI r2, 64
LDI r3, 32
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
