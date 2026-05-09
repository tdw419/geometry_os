; DESCRIPTION: Creates a green rectangular region at (38, 48) spanning 20 by 86 pixels.
; PLAN: r0=38(x), r1=48(y), r2=20(width), r3=86(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 48
LDI r2, 20
LDI r3, 86
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
