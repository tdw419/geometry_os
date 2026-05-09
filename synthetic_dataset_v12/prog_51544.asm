; DESCRIPTION: Creates a green rectangular region at (21, 68) spanning 99 by 113 pixels.
; PLAN: r0=21(x), r1=68(y), r2=99(width), r3=113(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 68
LDI r2, 99
LDI r3, 113
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
