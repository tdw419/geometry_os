; DESCRIPTION: Creates a blue rectangular region at (403, 121) spanning 91 by 22 pixels.
; PLAN: r0=403(x), r1=121(y), r2=91(width), r3=22(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 121
LDI r2, 91
LDI r3, 22
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
