; DESCRIPTION: Creates a green rectangular region at (166, 34) spanning 30 by 67 pixels.
; PLAN: r0=166(x), r1=34(y), r2=30(width), r3=67(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 34
LDI r2, 30
LDI r3, 67
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
