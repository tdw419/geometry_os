; DESCRIPTION: Creates a blue rectangular region at (39, 150) spanning 116 by 72 pixels.
; PLAN: r0=39(x), r1=150(y), r2=116(width), r3=72(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 150
LDI r2, 116
LDI r3, 72
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
