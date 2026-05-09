; DESCRIPTION: Creates a green rectangular region at (220, 21) spanning 25 by 86 pixels.
; PLAN: r0=220(x), r1=21(y), r2=25(width), r3=86(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 21
LDI r2, 25
LDI r3, 86
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
