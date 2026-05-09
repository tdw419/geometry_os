; DESCRIPTION: Creates a orange rectangular region at (386, 37) spanning 79 by 78 pixels.
; PLAN: r0=386(x), r1=37(y), r2=79(width), r3=78(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 37
LDI r2, 79
LDI r3, 78
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
