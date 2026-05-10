; DESCRIPTION: Creates a blue rectangular region at (127, 145) spanning 45 by 87 pixels.
; PLAN: r0=127(x), r1=145(y), r2=45(width), r3=87(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 145
LDI r2, 45
LDI r3, 87
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
