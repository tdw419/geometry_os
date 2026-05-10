; DESCRIPTION: Creates a white rectangular region at (409, 112) spanning 33 by 120 pixels.
; PLAN: r0=409(x), r1=112(y), r2=33(width), r3=120(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 112
LDI r2, 33
LDI r3, 120
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
