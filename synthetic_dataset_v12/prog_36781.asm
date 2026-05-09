; DESCRIPTION: Creates a green rectangular region at (331, 153) spanning 107 by 42 pixels.
; PLAN: r0=331(x), r1=153(y), r2=107(width), r3=42(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 153
LDI r2, 107
LDI r3, 42
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
