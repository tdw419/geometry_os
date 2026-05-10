; DESCRIPTION: Creates a yellow rectangular region at (415, 75) spanning 93 by 94 pixels.
; PLAN: r0=415(x), r1=75(y), r2=93(width), r3=94(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 75
LDI r2, 93
LDI r3, 94
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
