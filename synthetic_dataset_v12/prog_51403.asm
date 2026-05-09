; DESCRIPTION: Creates a purple rectangular region at (398, 48) spanning 81 by 116 pixels.
; PLAN: r0=398(x), r1=48(y), r2=81(width), r3=116(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 48
LDI r2, 81
LDI r3, 116
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
