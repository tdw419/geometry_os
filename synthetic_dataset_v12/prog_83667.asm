; DESCRIPTION: Creates a green rectangular region at (333, 127) spanning 106 by 80 pixels.
; PLAN: r0=333(x), r1=127(y), r2=106(width), r3=80(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 127
LDI r2, 106
LDI r3, 80
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
