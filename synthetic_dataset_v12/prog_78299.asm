; DESCRIPTION: Creates a purple rectangular region at (357, 186) spanning 16 by 63 pixels.
; PLAN: r0=357(x), r1=186(y), r2=16(width), r3=63(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 186
LDI r2, 16
LDI r3, 63
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
