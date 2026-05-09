; DESCRIPTION: Creates a yellow rectangular region at (193, 6) spanning 75 by 24 pixels.
; PLAN: r0=193(x), r1=6(y), r2=75(width), r3=24(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 6
LDI r2, 75
LDI r3, 24
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
