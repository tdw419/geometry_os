; DESCRIPTION: Creates a blue rectangular region at (384, 97) spanning 116 by 120 pixels.
; PLAN: r0=384(x), r1=97(y), r2=116(width), r3=120(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 97
LDI r2, 116
LDI r3, 120
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
