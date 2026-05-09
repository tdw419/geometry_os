; DESCRIPTION: Creates a green rectangular region at (138, 27) spanning 85 by 102 pixels.
; PLAN: r0=138(x), r1=27(y), r2=85(width), r3=102(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 27
LDI r2, 85
LDI r3, 102
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
