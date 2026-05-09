; DESCRIPTION: Creates a green rectangular region at (151, 146) spanning 14 by 20 pixels.
; PLAN: r0=151(x), r1=146(y), r2=14(width), r3=20(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 146
LDI r2, 14
LDI r3, 20
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
