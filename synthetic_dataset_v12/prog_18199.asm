; DESCRIPTION: Creates a green rectangular region at (382, 245) spanning 102 by 10 pixels.
; PLAN: r0=382(x), r1=245(y), r2=102(width), r3=10(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 245
LDI r2, 102
LDI r3, 10
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
