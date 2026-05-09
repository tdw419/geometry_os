; DESCRIPTION: Creates a green rectangular region at (28, 98) spanning 103 by 25 pixels.
; PLAN: r0=28(x), r1=98(y), r2=103(width), r3=25(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 98
LDI r2, 103
LDI r3, 25
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
