; DESCRIPTION: Creates a orange rectangular region at (147, 74) spanning 108 by 13 pixels.
; PLAN: r0=147(x), r1=74(y), r2=108(width), r3=13(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 74
LDI r2, 108
LDI r3, 13
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
