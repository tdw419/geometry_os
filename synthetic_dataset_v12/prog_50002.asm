; DESCRIPTION: Creates a orange rectangular region at (301, 173) spanning 72 by 54 pixels.
; PLAN: r0=301(x), r1=173(y), r2=72(width), r3=54(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 173
LDI r2, 72
LDI r3, 54
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
