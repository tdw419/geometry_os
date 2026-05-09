; DESCRIPTION: Creates a green rectangular region at (66, 133) spanning 104 by 102 pixels.
; PLAN: r0=66(x), r1=133(y), r2=104(width), r3=102(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 133
LDI r2, 104
LDI r3, 102
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
