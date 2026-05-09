; DESCRIPTION: Creates a green rectangular region at (108, 74) spanning 105 by 47 pixels.
; PLAN: r0=108(x), r1=74(y), r2=105(width), r3=47(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 74
LDI r2, 105
LDI r3, 47
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
