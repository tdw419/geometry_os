; DESCRIPTION: Creates a green rectangular region at (391, 123) spanning 18 by 50 pixels.
; PLAN: r0=391(x), r1=123(y), r2=18(width), r3=50(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 123
LDI r2, 18
LDI r3, 50
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
