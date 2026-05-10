; DESCRIPTION: Creates a green rectangular region at (179, 91) spanning 111 by 74 pixels.
; PLAN: r0=179(x), r1=91(y), r2=111(width), r3=74(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 91
LDI r2, 111
LDI r3, 74
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
