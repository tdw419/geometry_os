; DESCRIPTION: Creates a blue rectangular region at (13, 117) spanning 30 by 79 pixels.
; PLAN: r0=13(x), r1=117(y), r2=30(width), r3=79(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 117
LDI r2, 30
LDI r3, 79
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
