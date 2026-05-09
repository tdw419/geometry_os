; DESCRIPTION: Creates a purple rectangular region at (280, 45) spanning 91 by 21 pixels.
; PLAN: r0=280(x), r1=45(y), r2=91(width), r3=21(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 45
LDI r2, 91
LDI r3, 21
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
