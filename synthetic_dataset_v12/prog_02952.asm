; DESCRIPTION: Creates a green rectangular region at (194, 115) spanning 82 by 79 pixels.
; PLAN: r0=194(x), r1=115(y), r2=82(width), r3=79(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 115
LDI r2, 82
LDI r3, 79
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
