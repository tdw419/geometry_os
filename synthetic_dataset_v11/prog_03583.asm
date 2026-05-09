; DESCRIPTION: Creates a green rectangular region at (21, 86) spanning 113 by 57 pixels.
; PLAN: r0=21(x), r1=86(y), r2=113(width), r3=57(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 86
LDI r2, 113
LDI r3, 57
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
