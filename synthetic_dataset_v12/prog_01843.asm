; DESCRIPTION: Creates a purple rectangular region at (193, 70) spanning 94 by 98 pixels.
; PLAN: r0=193(x), r1=70(y), r2=94(width), r3=98(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 70
LDI r2, 94
LDI r3, 98
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
