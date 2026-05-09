; DESCRIPTION: Creates a orange rectangular region at (65, 225) spanning 52 by 26 pixels.
; PLAN: r0=65(x), r1=225(y), r2=52(width), r3=26(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 225
LDI r2, 52
LDI r3, 26
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
