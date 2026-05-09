; DESCRIPTION: Creates a green rectangular region at (275, 25) spanning 72 by 112 pixels.
; PLAN: r0=275(x), r1=25(y), r2=72(width), r3=112(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 25
LDI r2, 72
LDI r3, 112
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
