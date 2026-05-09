; DESCRIPTION: Creates a yellow rectangular region at (32, 11) spanning 117 by 63 pixels.
; PLAN: r0=32(x), r1=11(y), r2=117(width), r3=63(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 11
LDI r2, 117
LDI r3, 63
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
