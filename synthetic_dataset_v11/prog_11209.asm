; DESCRIPTION: Creates a yellow rectangular region at (32, 65) spanning 48 by 89 pixels.
; PLAN: r0=32(x), r1=65(y), r2=48(width), r3=89(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 65
LDI r2, 48
LDI r3, 89
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
