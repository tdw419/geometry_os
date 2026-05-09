; DESCRIPTION: Creates a red rectangular region at (145, 63) spanning 65 by 48 pixels.
; PLAN: r0=145(x), r1=63(y), r2=65(width), r3=48(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 63
LDI r2, 65
LDI r3, 48
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
