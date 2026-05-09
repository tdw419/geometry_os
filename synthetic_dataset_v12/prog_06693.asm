; DESCRIPTION: Creates a green rectangular region at (9, 8) spanning 58 by 57 pixels.
; PLAN: r0=9(x), r1=8(y), r2=58(width), r3=57(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 8
LDI r2, 58
LDI r3, 57
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
