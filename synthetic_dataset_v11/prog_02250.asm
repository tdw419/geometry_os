; DESCRIPTION: Creates a green rectangular region at (48, 86) spanning 103 by 91 pixels.
; PLAN: r0=48(x), r1=86(y), r2=103(width), r3=91(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 86
LDI r2, 103
LDI r3, 91
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
