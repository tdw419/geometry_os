; DESCRIPTION: Creates a green rectangular region at (81, 58) spanning 93 by 56 pixels.
; PLAN: r0=81(x), r1=58(y), r2=93(width), r3=56(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 58
LDI r2, 93
LDI r3, 56
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
