; DESCRIPTION: Creates a blue rectangular region at (199, 204) spanning 85 by 20 pixels.
; PLAN: r0=199(x), r1=204(y), r2=85(width), r3=20(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 204
LDI r2, 85
LDI r3, 20
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
