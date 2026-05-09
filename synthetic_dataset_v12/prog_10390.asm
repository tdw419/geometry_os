; DESCRIPTION: Creates a blue rectangular region at (295, 63) spanning 44 by 76 pixels.
; PLAN: r0=295(x), r1=63(y), r2=44(width), r3=76(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 63
LDI r2, 44
LDI r3, 76
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
