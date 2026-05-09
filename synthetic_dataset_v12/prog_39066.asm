; DESCRIPTION: Creates a green rectangular region at (367, 138) spanning 64 by 10 pixels.
; PLAN: r0=367(x), r1=138(y), r2=64(width), r3=10(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 138
LDI r2, 64
LDI r3, 10
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
