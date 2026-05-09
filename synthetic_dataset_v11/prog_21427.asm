; DESCRIPTION: Creates a green rectangular region at (39, 100) spanning 79 by 29 pixels.
; PLAN: r0=39(x), r1=100(y), r2=79(width), r3=29(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 100
LDI r2, 79
LDI r3, 29
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
