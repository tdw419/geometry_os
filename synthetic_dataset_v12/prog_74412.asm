; DESCRIPTION: Creates a blue rectangular region at (328, 44) spanning 92 by 37 pixels.
; PLAN: r0=328(x), r1=44(y), r2=92(width), r3=37(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 44
LDI r2, 92
LDI r3, 37
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
