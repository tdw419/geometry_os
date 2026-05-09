; DESCRIPTION: Creates a purple rectangular region at (464, 99) spanning 13 by 63 pixels.
; PLAN: r0=464(x), r1=99(y), r2=13(width), r3=63(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 464
LDI r1, 99
LDI r2, 13
LDI r3, 63
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
