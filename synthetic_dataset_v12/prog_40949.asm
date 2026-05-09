; DESCRIPTION: Creates a blue rectangular region at (464, 70) spanning 21 by 33 pixels.
; PLAN: r0=464(x), r1=70(y), r2=21(width), r3=33(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 464
LDI r1, 70
LDI r2, 21
LDI r3, 33
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
