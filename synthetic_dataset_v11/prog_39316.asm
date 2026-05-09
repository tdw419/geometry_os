; DESCRIPTION: Creates a green rectangular region at (113, 55) spanning 65 by 25 pixels.
; PLAN: r0=113(x), r1=55(y), r2=65(width), r3=25(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 55
LDI r2, 65
LDI r3, 25
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
