; DESCRIPTION: Creates a green rectangular region at (197, 149) spanning 91 by 56 pixels.
; PLAN: r0=197(x), r1=149(y), r2=91(width), r3=56(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 149
LDI r2, 91
LDI r3, 56
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
