; DESCRIPTION: Creates a yellow rectangular region at (321, 160) spanning 27 by 24 pixels.
; PLAN: r0=321(x), r1=160(y), r2=27(width), r3=24(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 160
LDI r2, 27
LDI r3, 24
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
