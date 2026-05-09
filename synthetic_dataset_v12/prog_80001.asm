; DESCRIPTION: Creates a green rectangular region at (272, 127) spanning 117 by 54 pixels.
; PLAN: r0=272(x), r1=127(y), r2=117(width), r3=54(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 127
LDI r2, 117
LDI r3, 54
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
