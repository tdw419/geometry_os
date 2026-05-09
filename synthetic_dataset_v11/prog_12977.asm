; DESCRIPTION: Creates a green rectangular region at (171, 6) spanning 25 by 112 pixels.
; PLAN: r0=171(x), r1=6(y), r2=25(width), r3=112(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 6
LDI r2, 25
LDI r3, 112
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
