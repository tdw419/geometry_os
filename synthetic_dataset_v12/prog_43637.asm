; DESCRIPTION: Creates a green rectangular region at (91, 38) spanning 64 by 45 pixels.
; PLAN: r0=91(x), r1=38(y), r2=64(width), r3=45(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 38
LDI r2, 64
LDI r3, 45
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
