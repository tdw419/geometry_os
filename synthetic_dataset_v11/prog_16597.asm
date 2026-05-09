; DESCRIPTION: Creates a green rectangular region at (104, 57) spanning 42 by 72 pixels.
; PLAN: r0=104(x), r1=57(y), r2=42(width), r3=72(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 57
LDI r2, 42
LDI r3, 72
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
