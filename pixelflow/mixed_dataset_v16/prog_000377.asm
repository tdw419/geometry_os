; DESCRIPTION: Creates a orange rectangular region at (222, 25) spanning 48 by 29 pixels.
; PLAN: r0=222(x), r1=25(y), r2=48(width), r3=29(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 25
LDI r2, 48
LDI r3, 29
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
