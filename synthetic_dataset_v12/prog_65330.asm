; DESCRIPTION: Creates a red rectangular region at (24, 155) spanning 79 by 84 pixels.
; PLAN: r0=24(x), r1=155(y), r2=79(width), r3=84(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 155
LDI r2, 79
LDI r3, 84
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
