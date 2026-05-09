; DESCRIPTION: Creates a blue rectangular region at (349, 22) spanning 120 by 85 pixels.
; PLAN: r0=349(x), r1=22(y), r2=120(width), r3=85(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 22
LDI r2, 120
LDI r3, 85
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
