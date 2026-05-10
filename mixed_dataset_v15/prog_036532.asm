; DESCRIPTION: Creates a yellow rectangular region at (408, 144) spanning 55 by 109 pixels.
; PLAN: r0=408(x), r1=144(y), r2=55(width), r3=109(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 144
LDI r2, 55
LDI r3, 109
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
