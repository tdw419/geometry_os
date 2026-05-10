; DESCRIPTION: Creates a green rectangular region at (187, 21) spanning 30 by 34 pixels.
; PLAN: r0=187(x), r1=21(y), r2=30(width), r3=34(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 21
LDI r2, 30
LDI r3, 34
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
