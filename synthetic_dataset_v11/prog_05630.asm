; DESCRIPTION: Creates a green rectangular region at (206, 40) spanning 47 by 114 pixels.
; PLAN: r0=206(x), r1=40(y), r2=47(width), r3=114(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 40
LDI r2, 47
LDI r3, 114
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
