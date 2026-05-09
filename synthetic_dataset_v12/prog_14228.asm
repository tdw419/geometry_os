; DESCRIPTION: Creates a white rectangular region at (441, 133) spanning 48 by 63 pixels.
; PLAN: r0=441(x), r1=133(y), r2=48(width), r3=63(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 133
LDI r2, 48
LDI r3, 63
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
