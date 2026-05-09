; DESCRIPTION: Creates a orange rectangular region at (80, 133) spanning 60 by 32 pixels.
; PLAN: r0=80(x), r1=133(y), r2=60(width), r3=32(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 133
LDI r2, 60
LDI r3, 32
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
