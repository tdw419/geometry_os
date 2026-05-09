; DESCRIPTION: Creates a yellow rectangular region at (2, 152) spanning 60 by 91 pixels.
; PLAN: r0=2(x), r1=152(y), r2=60(width), r3=91(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 152
LDI r2, 60
LDI r3, 91
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
