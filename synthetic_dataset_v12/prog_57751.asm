; DESCRIPTION: Creates a orange rectangular region at (303, 23) spanning 64 by 65 pixels.
; PLAN: r0=303(x), r1=23(y), r2=64(width), r3=65(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 23
LDI r2, 64
LDI r3, 65
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
