; DESCRIPTION: Creates a green rectangular region at (297, 71) spanning 90 by 25 pixels.
; PLAN: r0=297(x), r1=71(y), r2=90(width), r3=25(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 71
LDI r2, 90
LDI r3, 25
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
