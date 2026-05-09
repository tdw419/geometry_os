; DESCRIPTION: Creates a yellow rectangular region at (130, 8) spanning 80 by 57 pixels.
; PLAN: r0=130(x), r1=8(y), r2=80(width), r3=57(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 8
LDI r2, 80
LDI r3, 57
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
