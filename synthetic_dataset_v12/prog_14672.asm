; DESCRIPTION: Creates a orange rectangular region at (124, 95) spanning 61 by 39 pixels.
; PLAN: r0=124(x), r1=95(y), r2=61(width), r3=39(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 95
LDI r2, 61
LDI r3, 39
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
