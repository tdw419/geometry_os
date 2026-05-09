; DESCRIPTION: Creates a green rectangular region at (272, 0) spanning 61 by 19 pixels.
; PLAN: r0=272(x), r1=0(y), r2=61(width), r3=19(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 0
LDI r2, 61
LDI r3, 19
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
