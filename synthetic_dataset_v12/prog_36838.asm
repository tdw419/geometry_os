; DESCRIPTION: Creates a blue rectangular region at (84, 120) spanning 57 by 65 pixels.
; PLAN: r0=84(x), r1=120(y), r2=57(width), r3=65(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 120
LDI r2, 57
LDI r3, 65
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
