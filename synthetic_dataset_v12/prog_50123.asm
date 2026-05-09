; DESCRIPTION: Creates a green rectangular region at (98, 23) spanning 103 by 73 pixels.
; PLAN: r0=98(x), r1=23(y), r2=103(width), r3=73(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 23
LDI r2, 103
LDI r3, 73
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
