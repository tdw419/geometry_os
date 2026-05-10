; DESCRIPTION: Creates a white rectangular region at (345, 63) spanning 22 by 87 pixels.
; PLAN: r0=345(x), r1=63(y), r2=22(width), r3=87(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 63
LDI r2, 22
LDI r3, 87
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
