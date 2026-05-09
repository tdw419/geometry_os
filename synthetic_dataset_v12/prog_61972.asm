; DESCRIPTION: Creates a green rectangular region at (287, 74) spanning 66 by 109 pixels.
; PLAN: r0=287(x), r1=74(y), r2=66(width), r3=109(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 74
LDI r2, 66
LDI r3, 109
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
