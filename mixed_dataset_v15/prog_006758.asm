; DESCRIPTION: Creates a white rectangular region at (65, 57) spanning 27 by 91 pixels.
; PLAN: r0=65(x), r1=57(y), r2=27(width), r3=91(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 57
LDI r2, 27
LDI r3, 91
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
