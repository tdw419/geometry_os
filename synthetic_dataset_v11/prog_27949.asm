; DESCRIPTION: Creates a green rectangular region at (125, 107) spanning 87 by 100 pixels.
; PLAN: r0=125(x), r1=107(y), r2=87(width), r3=100(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 107
LDI r2, 87
LDI r3, 100
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
