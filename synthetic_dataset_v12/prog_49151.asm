; DESCRIPTION: Creates a green rectangular region at (240, 12) spanning 41 by 21 pixels.
; PLAN: r0=240(x), r1=12(y), r2=41(width), r3=21(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 12
LDI r2, 41
LDI r3, 21
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
