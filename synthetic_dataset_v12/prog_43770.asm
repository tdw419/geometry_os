; DESCRIPTION: Creates a green rectangular region at (47, 70) spanning 54 by 76 pixels.
; PLAN: r0=47(x), r1=70(y), r2=54(width), r3=76(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 70
LDI r2, 54
LDI r3, 76
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
