; DESCRIPTION: Creates a red rectangular region at (145, 63) spanning 32 by 33 pixels.
; PLAN: r0=145(x), r1=63(y), r2=32(width), r3=33(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 63
LDI r2, 32
LDI r3, 33
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
