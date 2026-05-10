; DESCRIPTION: Creates a green rectangular region at (102, 36) spanning 98 by 79 pixels.
; PLAN: r0=102(x), r1=36(y), r2=98(width), r3=79(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 36
LDI r2, 98
LDI r3, 79
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
