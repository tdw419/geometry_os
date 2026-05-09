; DESCRIPTION: Creates a blue rectangular region at (330, 3) spanning 87 by 47 pixels.
; PLAN: r0=330(x), r1=3(y), r2=87(width), r3=47(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 3
LDI r2, 87
LDI r3, 47
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
