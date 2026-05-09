; DESCRIPTION: Creates a orange rectangular region at (182, 90) spanning 55 by 48 pixels.
; PLAN: r0=182(x), r1=90(y), r2=55(width), r3=48(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 90
LDI r2, 55
LDI r3, 48
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
