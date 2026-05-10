; DESCRIPTION: Creates a orange rectangular region at (220, 128) spanning 115 by 91 pixels.
; PLAN: r0=220(x), r1=128(y), r2=115(width), r3=91(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 128
LDI r2, 115
LDI r3, 91
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
