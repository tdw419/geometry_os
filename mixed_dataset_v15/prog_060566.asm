; DESCRIPTION: Creates a green rectangular region at (267, 189) spanning 28 by 20 pixels.
; PLAN: r0=267(x), r1=189(y), r2=28(width), r3=20(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 189
LDI r2, 28
LDI r3, 20
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
