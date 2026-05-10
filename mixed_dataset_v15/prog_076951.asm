; DESCRIPTION: Creates a green rectangular region at (416, 95) spanning 54 by 14 pixels.
; PLAN: r0=416(x), r1=95(y), r2=54(width), r3=14(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 95
LDI r2, 54
LDI r3, 14
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
