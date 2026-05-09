; DESCRIPTION: Creates a purple rectangular region at (317, 65) spanning 81 by 76 pixels.
; PLAN: r0=317(x), r1=65(y), r2=81(width), r3=76(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 65
LDI r2, 81
LDI r3, 76
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
