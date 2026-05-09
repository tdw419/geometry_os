; DESCRIPTION: Creates a red rectangular region at (132, 63) spanning 13 by 115 pixels.
; PLAN: r0=132(x), r1=63(y), r2=13(width), r3=115(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 63
LDI r2, 13
LDI r3, 115
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
