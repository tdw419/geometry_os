; DESCRIPTION: Creates a green rectangular region at (140, 47) spanning 93 by 103 pixels.
; PLAN: r0=140(x), r1=47(y), r2=93(width), r3=103(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 47
LDI r2, 93
LDI r3, 103
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
