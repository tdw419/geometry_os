; DESCRIPTION: Creates a green rectangular region at (115, 98) spanning 18 by 77 pixels.
; PLAN: r0=115(x), r1=98(y), r2=18(width), r3=77(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 98
LDI r2, 18
LDI r3, 77
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
