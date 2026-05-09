; DESCRIPTION: Creates a green rectangular region at (75, 16) spanning 49 by 29 pixels.
; PLAN: r0=75(x), r1=16(y), r2=49(width), r3=29(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 16
LDI r2, 49
LDI r3, 29
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
