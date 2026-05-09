; DESCRIPTION: Creates a green rectangular region at (105, 59) spanning 57 by 79 pixels.
; PLAN: r0=105(x), r1=59(y), r2=57(width), r3=79(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 59
LDI r2, 57
LDI r3, 79
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
