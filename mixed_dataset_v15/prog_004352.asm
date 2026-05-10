; DESCRIPTION: Creates a orange rectangular region at (166, 22) spanning 59 by 33 pixels.
; PLAN: r0=166(x), r1=22(y), r2=59(width), r3=33(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 22
LDI r2, 59
LDI r3, 33
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
