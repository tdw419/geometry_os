; DESCRIPTION: Creates a green rectangular region at (403, 58) spanning 49 by 114 pixels.
; PLAN: r0=403(x), r1=58(y), r2=49(width), r3=114(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 58
LDI r2, 49
LDI r3, 114
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
