; DESCRIPTION: Creates a purple rectangular region at (256, 150) spanning 23 by 92 pixels.
; PLAN: r0=256(x), r1=150(y), r2=23(width), r3=92(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 150
LDI r2, 23
LDI r3, 92
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
