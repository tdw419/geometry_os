; DESCRIPTION: Creates a blue rectangular region at (156, 38) spanning 79 by 99 pixels.
; PLAN: r0=156(x), r1=38(y), r2=79(width), r3=99(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 38
LDI r2, 79
LDI r3, 99
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
