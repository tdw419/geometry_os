; DESCRIPTION: Creates a purple rectangular region at (256, 69) spanning 59 by 93 pixels.
; PLAN: r0=256(x), r1=69(y), r2=59(width), r3=93(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 69
LDI r2, 59
LDI r3, 93
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
