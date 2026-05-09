; DESCRIPTION: Creates a black rectangular region at (428, 95) spanning 27 by 85 pixels.
; PLAN: r0=428(x), r1=95(y), r2=27(width), r3=85(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 95
LDI r2, 27
LDI r3, 85
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
