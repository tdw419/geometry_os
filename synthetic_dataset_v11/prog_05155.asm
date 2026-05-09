; DESCRIPTION: Creates a green rectangular region at (47, 27) spanning 117 by 44 pixels.
; PLAN: r0=47(x), r1=27(y), r2=117(width), r3=44(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 27
LDI r2, 117
LDI r3, 44
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
