; DESCRIPTION: Creates a green rectangular region at (308, 38) spanning 92 by 83 pixels.
; PLAN: r0=308(x), r1=38(y), r2=92(width), r3=83(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 38
LDI r2, 92
LDI r3, 83
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
