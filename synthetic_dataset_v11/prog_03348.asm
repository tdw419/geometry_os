; DESCRIPTION: Creates a green rectangular region at (79, 31) spanning 11 by 58 pixels.
; PLAN: r0=79(x), r1=31(y), r2=11(width), r3=58(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 31
LDI r2, 11
LDI r3, 58
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
