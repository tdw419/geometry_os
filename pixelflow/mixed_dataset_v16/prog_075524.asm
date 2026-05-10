; DESCRIPTION: Creates a yellow rectangular region at (195, 161) spanning 56 by 48 pixels.
; PLAN: r0=195(x), r1=161(y), r2=56(width), r3=48(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 161
LDI r2, 56
LDI r3, 48
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
