; DESCRIPTION: Creates a blue rectangular region at (127, 169) spanning 83 by 46 pixels.
; PLAN: r0=127(x), r1=169(y), r2=83(width), r3=46(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 169
LDI r2, 83
LDI r3, 46
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
