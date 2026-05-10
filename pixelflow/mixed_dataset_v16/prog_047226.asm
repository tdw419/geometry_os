; DESCRIPTION: Creates a white rectangular region at (77, 169) spanning 80 by 70 pixels.
; PLAN: r0=77(x), r1=169(y), r2=80(width), r3=70(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 169
LDI r2, 80
LDI r3, 70
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
