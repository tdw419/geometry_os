; DESCRIPTION: Creates a green rectangular region at (10, 157) spanning 68 by 36 pixels.
; PLAN: r0=10(x), r1=157(y), r2=68(width), r3=36(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 157
LDI r2, 68
LDI r3, 36
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
