; DESCRIPTION: Creates a green rectangular region at (85, 3) spanning 86 by 113 pixels.
; PLAN: r0=85(x), r1=3(y), r2=86(width), r3=113(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 3
LDI r2, 86
LDI r3, 113
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
