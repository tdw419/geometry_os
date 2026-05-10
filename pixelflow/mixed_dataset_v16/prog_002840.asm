; DESCRIPTION: Creates a green rectangular region at (450, 52) spanning 23 by 95 pixels.
; PLAN: r0=450(x), r1=52(y), r2=23(width), r3=95(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 52
LDI r2, 23
LDI r3, 95
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
