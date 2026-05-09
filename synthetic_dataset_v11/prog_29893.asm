; DESCRIPTION: Creates a green rectangular region at (120, 70) spanning 96 by 28 pixels.
; PLAN: r0=120(x), r1=70(y), r2=96(width), r3=28(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 70
LDI r2, 96
LDI r3, 28
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
