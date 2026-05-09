; DESCRIPTION: Creates a green rectangular region at (82, 157) spanning 114 by 96 pixels.
; PLAN: r0=82(x), r1=157(y), r2=114(width), r3=96(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 157
LDI r2, 114
LDI r3, 96
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
