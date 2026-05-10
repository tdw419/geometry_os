; DESCRIPTION: Creates a green rectangular region at (336, 111) spanning 117 by 47 pixels.
; PLAN: r0=336(x), r1=111(y), r2=117(width), r3=47(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 111
LDI r2, 117
LDI r3, 47
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
