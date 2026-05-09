; DESCRIPTION: Creates a yellow rectangular region at (166, 63) spanning 55 by 45 pixels.
; PLAN: r0=166(x), r1=63(y), r2=55(width), r3=45(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 63
LDI r2, 55
LDI r3, 45
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
