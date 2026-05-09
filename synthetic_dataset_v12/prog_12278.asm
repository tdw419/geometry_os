; DESCRIPTION: Creates a purple rectangular region at (464, 160) spanning 22 by 48 pixels.
; PLAN: r0=464(x), r1=160(y), r2=22(width), r3=48(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 464
LDI r1, 160
LDI r2, 22
LDI r3, 48
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
