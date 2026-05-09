; DESCRIPTION: Creates a orange rectangular region at (125, 91) spanning 10 by 60 pixels.
; PLAN: r0=125(x), r1=91(y), r2=10(width), r3=60(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 91
LDI r2, 10
LDI r3, 60
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
