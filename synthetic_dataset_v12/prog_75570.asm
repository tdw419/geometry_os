; DESCRIPTION: Creates a blue rectangular region at (422, 47) spanning 76 by 63 pixels.
; PLAN: r0=422(x), r1=47(y), r2=76(width), r3=63(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 47
LDI r2, 76
LDI r3, 63
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
