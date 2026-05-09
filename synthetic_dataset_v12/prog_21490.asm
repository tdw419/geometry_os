; DESCRIPTION: Creates a green rectangular region at (82, 104) spanning 66 by 102 pixels.
; PLAN: r0=82(x), r1=104(y), r2=66(width), r3=102(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 104
LDI r2, 66
LDI r3, 102
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
