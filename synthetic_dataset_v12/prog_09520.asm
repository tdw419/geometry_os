; DESCRIPTION: Creates a blue rectangular region at (403, 86) spanning 70 by 31 pixels.
; PLAN: r0=403(x), r1=86(y), r2=70(width), r3=31(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 86
LDI r2, 70
LDI r3, 31
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
