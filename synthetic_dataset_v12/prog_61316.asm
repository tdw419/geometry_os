; DESCRIPTION: Creates a purple rectangular region at (409, 65) spanning 79 by 27 pixels.
; PLAN: r0=409(x), r1=65(y), r2=79(width), r3=27(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 65
LDI r2, 79
LDI r3, 27
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
