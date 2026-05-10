; DESCRIPTION: Creates a white rectangular region at (374, 89) spanning 32 by 33 pixels.
; PLAN: r0=374(x), r1=89(y), r2=32(width), r3=33(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 89
LDI r2, 32
LDI r3, 33
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
