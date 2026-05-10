; DESCRIPTION: Creates a purple rectangular region at (415, 8) spanning 71 by 89 pixels.
; PLAN: r0=415(x), r1=8(y), r2=71(width), r3=89(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 8
LDI r2, 71
LDI r3, 89
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
