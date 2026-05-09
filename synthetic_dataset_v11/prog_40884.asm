; DESCRIPTION: Creates a orange rectangular region at (220, 60) spanning 13 by 119 pixels.
; PLAN: r0=220(x), r1=60(y), r2=13(width), r3=119(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 60
LDI r2, 13
LDI r3, 119
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
