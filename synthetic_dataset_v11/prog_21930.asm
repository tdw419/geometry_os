; DESCRIPTION: Creates a yellow rectangular region at (160, 48) spanning 63 by 55 pixels.
; PLAN: r0=160(x), r1=48(y), r2=63(width), r3=55(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 48
LDI r2, 63
LDI r3, 55
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
