; DESCRIPTION: Creates a orange rectangular region at (117, 143) spanning 61 by 36 pixels.
; PLAN: r0=117(x), r1=143(y), r2=61(width), r3=36(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 143
LDI r2, 61
LDI r3, 36
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
