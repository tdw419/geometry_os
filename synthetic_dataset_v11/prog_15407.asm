; DESCRIPTION: Creates a green rectangular region at (21, 57) spanning 79 by 57 pixels.
; PLAN: r0=21(x), r1=57(y), r2=79(width), r3=57(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 57
LDI r2, 79
LDI r3, 57
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
