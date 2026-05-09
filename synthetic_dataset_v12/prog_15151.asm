; DESCRIPTION: Creates a orange rectangular region at (193, 76) spanning 39 by 95 pixels.
; PLAN: r0=193(x), r1=76(y), r2=39(width), r3=95(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 76
LDI r2, 39
LDI r3, 95
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
