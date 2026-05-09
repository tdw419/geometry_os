; DESCRIPTION: Creates a white rectangular region at (270, 75) spanning 91 by 38 pixels.
; PLAN: r0=270(x), r1=75(y), r2=91(width), r3=38(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 75
LDI r2, 91
LDI r3, 38
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
