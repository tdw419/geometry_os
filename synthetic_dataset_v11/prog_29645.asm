; DESCRIPTION: Creates a green rectangular region at (75, 194) spanning 77 by 28 pixels.
; PLAN: r0=75(x), r1=194(y), r2=77(width), r3=28(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 194
LDI r2, 77
LDI r3, 28
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
