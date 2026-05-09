; DESCRIPTION: Creates a orange rectangular region at (135, 65) spanning 58 by 16 pixels.
; PLAN: r0=135(x), r1=65(y), r2=58(width), r3=16(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 65
LDI r2, 58
LDI r3, 16
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
