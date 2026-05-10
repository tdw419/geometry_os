; DESCRIPTION: Creates a orange rectangular region at (157, 94) spanning 117 by 26 pixels.
; PLAN: r0=157(x), r1=94(y), r2=117(width), r3=26(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 94
LDI r2, 117
LDI r3, 26
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
