; DESCRIPTION: Creates a blue rectangular region at (221, 152) spanning 13 by 70 pixels.
; PLAN: r0=221(x), r1=152(y), r2=13(width), r3=70(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 152
LDI r2, 13
LDI r3, 70
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
