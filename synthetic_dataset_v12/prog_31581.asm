; DESCRIPTION: Creates a blue rectangular region at (355, 173) spanning 91 by 55 pixels.
; PLAN: r0=355(x), r1=173(y), r2=91(width), r3=55(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 173
LDI r2, 91
LDI r3, 55
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
