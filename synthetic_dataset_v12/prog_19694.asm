; DESCRIPTION: Creates a green rectangular region at (305, 20) spanning 30 by 13 pixels.
; PLAN: r0=305(x), r1=20(y), r2=30(width), r3=13(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 20
LDI r2, 30
LDI r3, 13
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
