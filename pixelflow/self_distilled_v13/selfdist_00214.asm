; DESCRIPTION: Renders a green rectangular region spanning 110 by 76 at (398, 58).
; PLAN: r0=398(x), r1=58(y), r2=110(width), r3=76(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 58
LDI r2, 110
LDI r3, 76
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
