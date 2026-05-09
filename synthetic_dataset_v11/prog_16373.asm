; DESCRIPTION: Creates a green rectangular region at (174, 200) spanning 20 by 41 pixels.
; PLAN: r0=174(x), r1=200(y), r2=20(width), r3=41(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 200
LDI r2, 20
LDI r3, 41
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
