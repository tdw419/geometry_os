; DESCRIPTION: Creates a purple rectangular region at (365, 85) spanning 70 by 80 pixels.
; PLAN: r0=365(x), r1=85(y), r2=70(width), r3=80(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 85
LDI r2, 70
LDI r3, 80
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
