; DESCRIPTION: Creates a purple rectangular region at (143, 95) spanning 44 by 84 pixels.
; PLAN: r0=143(x), r1=95(y), r2=44(width), r3=84(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 95
LDI r2, 44
LDI r3, 84
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
