; DESCRIPTION: Creates a orange rectangular region at (115, 21) spanning 61 by 117 pixels.
; PLAN: r0=115(x), r1=21(y), r2=61(width), r3=117(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 21
LDI r2, 61
LDI r3, 117
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
