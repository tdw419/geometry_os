; DESCRIPTION: Creates a green rectangular region at (416, 117) spanning 22 by 113 pixels.
; PLAN: r0=416(x), r1=117(y), r2=22(width), r3=113(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 117
LDI r2, 22
LDI r3, 113
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
