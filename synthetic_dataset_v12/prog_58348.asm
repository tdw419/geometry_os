; DESCRIPTION: Creates a yellow rectangular region at (152, 140) spanning 111 by 110 pixels.
; PLAN: r0=152(x), r1=140(y), r2=111(width), r3=110(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 140
LDI r2, 111
LDI r3, 110
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
