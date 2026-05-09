; DESCRIPTION: Creates a green rectangular region at (178, 117) spanning 30 by 60 pixels.
; PLAN: r0=178(x), r1=117(y), r2=30(width), r3=60(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 117
LDI r2, 30
LDI r3, 60
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
