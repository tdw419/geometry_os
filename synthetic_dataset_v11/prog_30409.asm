; DESCRIPTION: Creates a green rectangular region at (32, 98) spanning 57 by 20 pixels.
; PLAN: r0=32(x), r1=98(y), r2=57(width), r3=20(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 98
LDI r2, 57
LDI r3, 20
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
