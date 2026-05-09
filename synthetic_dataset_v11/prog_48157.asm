; DESCRIPTION: Creates a green rectangular region at (102, 168) spanning 108 by 38 pixels.
; PLAN: r0=102(x), r1=168(y), r2=108(width), r3=38(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 168
LDI r2, 108
LDI r3, 38
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
