; DESCRIPTION: Creates a green rectangular region at (400, 65) spanning 64 by 25 pixels.
; PLAN: r0=400(x), r1=65(y), r2=64(width), r3=25(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 65
LDI r2, 64
LDI r3, 25
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
