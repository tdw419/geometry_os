; DESCRIPTION: Creates a orange rectangular region at (91, 222) spanning 92 by 33 pixels.
; PLAN: r0=91(x), r1=222(y), r2=92(width), r3=33(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 222
LDI r2, 92
LDI r3, 33
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
