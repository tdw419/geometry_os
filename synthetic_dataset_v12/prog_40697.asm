; DESCRIPTION: Creates a green rectangular region at (34, 171) spanning 25 by 79 pixels.
; PLAN: r0=34(x), r1=171(y), r2=25(width), r3=79(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 171
LDI r2, 25
LDI r3, 79
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
