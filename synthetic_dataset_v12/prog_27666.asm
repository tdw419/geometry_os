; DESCRIPTION: Creates a yellow rectangular region at (229, 87) spanning 85 by 98 pixels.
; PLAN: r0=229(x), r1=87(y), r2=85(width), r3=98(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 87
LDI r2, 85
LDI r3, 98
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
