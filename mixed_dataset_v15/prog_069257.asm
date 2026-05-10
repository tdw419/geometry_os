; DESCRIPTION: Creates a blue rectangular region at (83, 133) spanning 89 by 85 pixels.
; PLAN: r0=83(x), r1=133(y), r2=89(width), r3=85(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 133
LDI r2, 89
LDI r3, 85
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
