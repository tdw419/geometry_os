; DESCRIPTION: Creates a yellow rectangular region at (46, 56) spanning 38 by 79 pixels.
; PLAN: r0=46(x), r1=56(y), r2=38(width), r3=79(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 56
LDI r2, 38
LDI r3, 79
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
