; DESCRIPTION: Creates a green rectangular region at (107, 86) spanning 21 by 90 pixels.
; PLAN: r0=107(x), r1=86(y), r2=21(width), r3=90(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 86
LDI r2, 21
LDI r3, 90
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
