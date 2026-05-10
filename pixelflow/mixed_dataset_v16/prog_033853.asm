; DESCRIPTION: Creates a green rectangular region at (340, 225) spanning 10 by 26 pixels.
; PLAN: r0=340(x), r1=225(y), r2=10(width), r3=26(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 225
LDI r2, 10
LDI r3, 26
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
