; DESCRIPTION: Creates a green rectangular region at (46, 26) spanning 80 by 83 pixels.
; PLAN: r0=46(x), r1=26(y), r2=80(width), r3=83(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 26
LDI r2, 80
LDI r3, 83
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
