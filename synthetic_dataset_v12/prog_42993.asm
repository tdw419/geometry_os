; DESCRIPTION: Creates a orange rectangular region at (392, 165) spanning 38 by 62 pixels.
; PLAN: r0=392(x), r1=165(y), r2=38(width), r3=62(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 165
LDI r2, 38
LDI r3, 62
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
