; DESCRIPTION: Creates a green rectangular region at (174, 24) spanning 27 by 26 pixels.
; PLAN: r0=174(x), r1=24(y), r2=27(width), r3=26(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 24
LDI r2, 27
LDI r3, 26
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
