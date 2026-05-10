; DESCRIPTION: Creates a blue rectangular region at (23, 91) spanning 95 by 27 pixels.
; PLAN: r0=23(x), r1=91(y), r2=95(width), r3=27(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 91
LDI r2, 95
LDI r3, 27
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
