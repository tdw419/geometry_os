; DESCRIPTION: Creates a blue rectangular region at (91, 33) spanning 55 by 103 pixels.
; PLAN: r0=91(x), r1=33(y), r2=55(width), r3=103(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 33
LDI r2, 55
LDI r3, 103
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
