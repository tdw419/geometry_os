; DESCRIPTION: Creates a white rectangular region at (229, 6) spanning 91 by 109 pixels.
; PLAN: r0=229(x), r1=6(y), r2=91(width), r3=109(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 6
LDI r2, 91
LDI r3, 109
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
