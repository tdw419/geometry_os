; DESCRIPTION: Creates a purple rectangular region at (24, 12) spanning 63 by 77 pixels.
; PLAN: r0=24(x), r1=12(y), r2=63(width), r3=77(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 12
LDI r2, 63
LDI r3, 77
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
