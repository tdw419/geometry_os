; DESCRIPTION: Creates a green rectangular region at (398, 17) spanning 94 by 108 pixels.
; PLAN: r0=398(x), r1=17(y), r2=94(width), r3=108(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 17
LDI r2, 94
LDI r3, 108
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
