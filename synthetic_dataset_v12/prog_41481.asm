; DESCRIPTION: Creates a orange rectangular region at (392, 96) spanning 108 by 89 pixels.
; PLAN: r0=392(x), r1=96(y), r2=108(width), r3=89(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 96
LDI r2, 108
LDI r3, 89
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
