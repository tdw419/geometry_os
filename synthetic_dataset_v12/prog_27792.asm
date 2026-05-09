; DESCRIPTION: Creates a orange rectangular region at (141, 39) spanning 117 by 92 pixels.
; PLAN: r0=141(x), r1=39(y), r2=117(width), r3=92(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 39
LDI r2, 117
LDI r3, 92
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
