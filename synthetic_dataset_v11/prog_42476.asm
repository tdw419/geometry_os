; DESCRIPTION: Creates a green rectangular region at (113, 93) spanning 44 by 104 pixels.
; PLAN: r0=113(x), r1=93(y), r2=44(width), r3=104(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 93
LDI r2, 44
LDI r3, 104
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
