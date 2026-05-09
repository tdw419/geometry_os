; DESCRIPTION: Creates a yellow rectangular region at (32, 160) spanning 99 by 91 pixels.
; PLAN: r0=32(x), r1=160(y), r2=99(width), r3=91(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 160
LDI r2, 99
LDI r3, 91
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
