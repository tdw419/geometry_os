; DESCRIPTION: Creates a orange rectangular region at (171, 106) spanning 73 by 103 pixels.
; PLAN: r0=171(x), r1=106(y), r2=73(width), r3=103(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 106
LDI r2, 73
LDI r3, 103
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
