; DESCRIPTION: Creates a red rectangular region at (363, 63) spanning 92 by 79 pixels.
; PLAN: r0=363(x), r1=63(y), r2=92(width), r3=79(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 63
LDI r2, 92
LDI r3, 79
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
