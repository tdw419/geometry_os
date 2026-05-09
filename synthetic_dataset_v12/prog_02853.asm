; DESCRIPTION: Creates a yellow rectangular region at (403, 161) spanning 22 by 16 pixels.
; PLAN: r0=403(x), r1=161(y), r2=22(width), r3=16(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 161
LDI r2, 22
LDI r3, 16
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
