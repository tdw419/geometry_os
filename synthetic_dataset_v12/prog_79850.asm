; DESCRIPTION: Creates a green rectangular region at (366, 38) spanning 36 by 61 pixels.
; PLAN: r0=366(x), r1=38(y), r2=36(width), r3=61(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 38
LDI r2, 36
LDI r3, 61
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
