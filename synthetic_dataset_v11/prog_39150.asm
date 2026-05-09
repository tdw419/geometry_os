; DESCRIPTION: Creates a green rectangular region at (12, 126) spanning 105 by 27 pixels.
; PLAN: r0=12(x), r1=126(y), r2=105(width), r3=27(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 126
LDI r2, 105
LDI r3, 27
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
