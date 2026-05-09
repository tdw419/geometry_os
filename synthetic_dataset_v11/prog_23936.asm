; DESCRIPTION: Creates a blue rectangular region at (93, 150) spanning 34 by 77 pixels.
; PLAN: r0=93(x), r1=150(y), r2=34(width), r3=77(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 150
LDI r2, 34
LDI r3, 77
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
