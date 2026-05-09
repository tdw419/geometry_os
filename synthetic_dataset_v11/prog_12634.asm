; DESCRIPTION: Creates a green rectangular region at (73, 113) spanning 80 by 61 pixels.
; PLAN: r0=73(x), r1=113(y), r2=80(width), r3=61(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 113
LDI r2, 80
LDI r3, 61
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
