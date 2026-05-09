; DESCRIPTION: Creates a purple rectangular region at (305, 142) spanning 21 by 106 pixels.
; PLAN: r0=305(x), r1=142(y), r2=21(width), r3=106(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 142
LDI r2, 21
LDI r3, 106
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
