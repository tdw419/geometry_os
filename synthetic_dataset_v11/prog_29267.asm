; DESCRIPTION: Creates a green rectangular region at (142, 74) spanning 82 by 78 pixels.
; PLAN: r0=142(x), r1=74(y), r2=82(width), r3=78(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 74
LDI r2, 82
LDI r3, 78
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
