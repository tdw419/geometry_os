; DESCRIPTION: Creates a green rectangular region at (334, 124) spanning 120 by 102 pixels.
; PLAN: r0=334(x), r1=124(y), r2=120(width), r3=102(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 124
LDI r2, 120
LDI r3, 102
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
