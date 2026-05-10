; DESCRIPTION: Creates a green rectangular region at (419, 191) spanning 60 by 10 pixels.
; PLAN: r0=419(x), r1=191(y), r2=60(width), r3=10(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 191
LDI r2, 60
LDI r3, 10
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
