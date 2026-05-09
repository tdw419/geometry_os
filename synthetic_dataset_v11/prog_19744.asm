; DESCRIPTION: Creates a orange rectangular region at (135, 193) spanning 72 by 37 pixels.
; PLAN: r0=135(x), r1=193(y), r2=72(width), r3=37(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 193
LDI r2, 72
LDI r3, 37
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
