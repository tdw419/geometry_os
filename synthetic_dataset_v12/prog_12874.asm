; DESCRIPTION: Creates a purple rectangular region at (384, 178) spanning 116 by 64 pixels.
; PLAN: r0=384(x), r1=178(y), r2=116(width), r3=64(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 178
LDI r2, 116
LDI r3, 64
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
