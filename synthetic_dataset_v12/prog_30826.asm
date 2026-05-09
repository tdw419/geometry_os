; DESCRIPTION: Creates a green rectangular region at (220, 131) spanning 61 by 81 pixels.
; PLAN: r0=220(x), r1=131(y), r2=61(width), r3=81(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 131
LDI r2, 61
LDI r3, 81
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
