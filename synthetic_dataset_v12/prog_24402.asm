; DESCRIPTION: Creates a yellow rectangular region at (13, 32) spanning 61 by 91 pixels.
; PLAN: r0=13(x), r1=32(y), r2=61(width), r3=91(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 32
LDI r2, 61
LDI r3, 91
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
